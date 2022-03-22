//
//  HomeView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI
import Alamofire

struct HomeView: View {
  @EnvironmentObject var auth: Authentication
  @ObservedObject var presenter: HomePresenter
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
        if presenter.tasks.count == 0 {
          presenter.fetchTasks(UserMapper.authToDomain(auth.savedUser))
        }
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
    VStack {
      Text("ERROR")
      Text(presenter.errorMessage)
      Button(action: {
        presenter.fetchTasks(Constants.dummyUser)
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
        Image(systemName: "person.circle")
          .resizable()
          .frame(width: 25, height: 25)
          .onTapGesture {
            auth.signOut()
          }
        spacer
        Image(systemName: "bell.fill")
          .resizable()
          .frame(width: 25, height: 25)
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
        CategoryBoxView(title: "Hadir", quantity: 200, color: .cgreen)
        spacer
        CategoryBoxView(title: "Alpha", quantity: 5, color: .cred)
        spacer
        CategoryBoxView(title: "Izin", quantity: 200, color: .cpurple)
        spacer
      }
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else {
        LazyVStack(spacing: 10) {
          ForEach(presenter.tasks, id: \.id) { task in
            presenter.linkBuilder(for: task) {
              TaskItemView(task: task, color: .cgreen)
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
          Text(task.time)
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
