//
//  HomeView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ScrollView {
      content
    }
  }
}

extension HomeView {
  
  private var background: some View {
    Image("SignerBackground")
      .resizable()
      .scaledToFill()
      .edgesIgnoringSafeArea(.all)
  }
  
  private var content: some View {
    VStack(alignment: .leading) {
      HStack {
        Image(systemName: "person.circle")
          .resizable()
          .frame(width: 25, height: 25)
        spacer
        Image(systemName: "bell.fill")
          .resizable()
          .frame(width: 25, height: 25)
      }
      .padding(.vertical)
      .padding(.horizontal, 30)
      VStack(alignment: .leading) {
        Text("Selamat Pagi,")
        Text("Udinus Santhos")
          .font(.title)
          .bold()
      }
      .padding()
      HStack {
        spacer
        CategoryBoxView(title: "Hadir", quantity: 200, color: .cgreen)
        spacer
        CategoryBoxView(title: "Alpha", quantity: 5, color: .cred)
        spacer
        CategoryBoxView(title: "Izin", quantity: 200, color: .cpurple)
        spacer
      }
      LazyVStack(spacing: 10) {
        TaskItemView(title: "Alpha", time: "5-10-2020", desc: "Matematika", author: "Bapak Udiono", type: "Algoritma", color: .cgreen)
        TaskItemView(title: "Alpha", time: "5-10-2020", desc: "Matematika", author: "Bapak Udiono", type: "Algoritma", color: .cred)
        TaskItemView(title: "Alpha", time: "5-10-2020", desc: "Matematika", author: "Bapak Udiono", type: "Algoritma", color: .cpurple)
        TaskItemView(title: "Alpha", time: "5-10-2020", desc: "Matematika", author: "Bapak Udiono", type: "Algoritma", color: .cgreen)
      }
      .padding(.vertical, 20)
      spacer
    }
    .font(.custom("Poppins", size: 16))
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
  let title: String
  let time: String
  let desc: String
  let author: String
  let type: String
  let color: Color
  var body: some View {
    HStack(spacing: 0) {
      color
        .frame(width: UIScreen.main.bounds.width / 11.5, height: 100)
      Spacer()
      VStack {
        Text(title)
        Text(time)
          .font(.callout)
          .foregroundColor(Color(.systemGray))
      }
      .padding()
      Spacer()
      Text(type)
        .padding()
      Spacer()
      VStack {
        Text(author)
        Text(desc)
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

private struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
