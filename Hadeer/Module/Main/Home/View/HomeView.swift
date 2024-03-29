//
//  HomeView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var auth: Authentication
  @ObservedObject var presenter: HomePresenter
  @EnvironmentObject var ssm: StudentSocketManager
  
  @State private var once = false
  var body: some View {
    ZStack {
      Color.white
      ScrollView {
        ZStack(alignment: .top) {
          Color.cblue
            .frame(height: 500)
            .offset(x: 0, y: -500)
          background
            .offset(x: 0, y: -65)
          LazyVStack {
            content
              .font(.poppins)
          }
        }
      }
      .onAppear {
        ssm.login(auth.savedUser.id)
          presenter.fetchTasks(UserMapper.authToDomain(auth.savedUser))
      }
    }
    .navigationTitle("")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarHidden(true)
  }
}

extension HomeView {
  
  private var loadingIndicator: some View {
    HStack {
      spacer
      VStack {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
        Text("Loading...")
      }
      spacer
    }
    .padding()
  }
  
  private var errorIndicator: some View {
    HStack {
      Spacer()
      VStack {
        Text("ERROR")
        Text(presenter.errorMessage)
        Button(action: {
          presenter.fetchTasks(UserMapper.authToDomain(auth.savedUser))
        }) {
          VStack {
            Image(systemName: "arrow.counterclockwise")
              .resizable()
              .scaledToFit()
              .frame(height: 20)
            Text("Retry")
              .fontWeight(.bold)
          }
          .foregroundColor(.blue)
        }
        .padding(10)
        
      }
      .foregroundColor(.red)
      .padding()
      Spacer()
    }
  }
  
  private var emptyIndicator: some View {
    HStack {
      Spacer()
      Text("There's no tasks")
      Spacer()
    }
    .padding()
  }
  
  private var background: some View {
    Image("SignerBackground Half")
      .resizable()
      .scaledToFit()
      .edgesIgnoringSafeArea(.all)
  }
  
  private var content: some View {
    VStack(alignment: .leading) {
      HStack {
        Menu {
          Button("Logout") {
            auth.signOut()
            ssm.closeConnection()
            presenter.tasks = []
          }
        } label: {
          Image(systemName: "person.circle")
            .resizable()
            .frame(width: 25, height: 25)
        }
        spacer
        if auth.savedUser.isStudent() {
        Button(action: {
          presenter.fetchTasks(UserMapper.authToDomain(auth.savedUser))
        }) {
          Image(systemName: "arrow.clockwise")
            .font(.title2)
            .scaledToFit()
        }
      }
      }
      .foregroundColor(.white)
      .padding(.vertical)
      .padding(.horizontal, 30)
      VStack(alignment: .leading) {
        Text("Selamat Pagi,")
          .font(.title2)
        Text(auth.savedUser.name)
          .font(.title)
          .bold()
      }
      .foregroundColor(.white)
      .padding()
      .padding(.leading, 20)
      .padding(.bottom, 20)
      HStack {
        spacer
        CategoryBoxView(title: "Hadir", quantity: presenter.hadir, color: .cgreen)
        spacer
        CategoryBoxView(title: "Alpha", quantity: presenter.alpha, color: .cred)
        spacer
        CategoryBoxView(title: "Izin", quantity: presenter.izin, color: .cpurple)
        spacer
      }
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else if presenter.tasks.isEmpty {
        emptyIndicator
      } else {
       VStack(spacing: 10) {
          
          ForEach(presenter.tasks, id: \.id) { task in
            presenter.linkBuilder(for: task, color: auth.savedUser.isStudent() ? task.color() : .cgreen) {
              TaskItemView(task: task, color: auth.savedUser.isStudent() ? task.color() : .cgreen)
            }
          }
        }
        .padding(.vertical, 20)
      }
      spacer
    }
  }
  
  private var spacer: some View {
    Spacer()
  }
  
}

private struct CategoryBoxView: View {
  let title: String
  let quantity: Int
  let color: Color
  var body: some View {
    VStack {
      Text("\(quantity)")
        .font(.headline)
      Text(title)
        .font(.title2)
        .bold()
    }
    .foregroundColor(.white)
    .frame(width: (UIScreen.main.bounds.width - 150) / 3)
    .padding()
    .background(
      color
        .cornerRadius(10)
    )
    .shadow(color: color, radius: 2, x: 0, y: 1)
  }
}

private struct TaskItemView: View {
  let task: TaskModel
  let color: Color
  var body: some View {
    HStack(spacing: 0) {
      color
        .frame(width: UIScreen.main.bounds.width / 15, height: 100)
      Spacer()
      VStack {
        Text(task.title)
          .foregroundColor(.black)
        Text(task.time.formatToDate())
          .font(.callout)
          .foregroundColor(Color(.systemGray))
      }
      .padding()
      Spacer()
      Rectangle()
        .frame(width: 1, height: 50)
        .foregroundColor(Color(.systemGray6))
      Text(task.grade)
        .foregroundColor(.black)
        .padding()
      Rectangle()
        .frame(width: 1, height: 50)
        .foregroundColor(Color(.systemGray6))
      VStack {
        Text(task.teacherName)
          .foregroundColor(.black)
        Text(task.material)
          .font(.callout)
          .foregroundColor(Color(.systemGray))
      }
      .padding()
      
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .background(
      Color.white
        .shadow(radius: 1)
    )
  }
  
}

// private struct HomeView_Previews: PreviewProvider {
//  static var previews: some View {
//    HomeView()
//  }
// }
