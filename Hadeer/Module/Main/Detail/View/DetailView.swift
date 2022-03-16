//
//  DetailView.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI
import LinkPreview

struct DetailView: View {
  @StateObject var presenter: DetailPresenter
  var body: some View {
    content
  }
}

extension DetailView {
  
  private var content: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 0) {
        image
        bar
        status
        sections
        spacer
      }
    }
    .edgesIgnoringSafeArea(.top)
  }
  
  private var image: some View {
    Image("ph")
      .resizable()
      .scaledToFit()
  }
  private var bar: some View {
    Color.cgreen
      .frame(width: UIScreen.main.bounds.width, height: 30)
  }
  
  private var status: some View {
    HStack {
      VStack {
        Text(presenter.task.nama)
        Text(presenter.task.materi)
      }
      .padding()
      Rectangle()
        .frame(width: 1, height: 50)
        .foregroundColor(Color(.systemGray6))
      Text(presenter.task.guruID)
        .padding()
      Rectangle()
        .frame(width: 1, height: 50)
        .foregroundColor(Color(.systemGray6))
      VStack {
        Text("Hadir")
        Text(presenter.task.waktu)
          .font(.callout)
          .foregroundColor(Color(.systemGray))
      }
      .padding()
    }
    .padding(.vertical)
  }
  
  private var sections: some View {
    VStack(alignment: .leading) {
      devider
      HStack {
        Text("Waktu: ")
          .bold()
        Text("10.00 sampai 12.00 WIB")
        Spacer()
      }
      .padding()
      .padding(.vertical, 20)
      .frame(width: UIScreen.main.bounds.width)
      devider
      VStack {
        HStack {
          Text("Materi: ")
            .bold()
          Text("[Link](https://saweria.co/udinda)")
          Spacer()
        }
        LinkPreview(url: URL(string: "https://github.com/AddinDev/Komm"))
          .frame(width: UIScreen.main.bounds.width / 1.2)
      }
      .padding()
      .padding(.vertical, 20)
      .frame(width: UIScreen.main.bounds.width)
      devider
      VStack {
      HStack {
        Text("Absensi: ")
          .bold()
        Text("[Link](https://apple.com)")
        Spacer()
      }
        LinkPreview(url: URL(string: "https://github.com/AddinDev/coronaX"))
          .frame(width: UIScreen.main.bounds.width / 1.2)
      }
      .padding()
      .padding(.vertical, 20)
      .frame(width: UIScreen.main.bounds.width)
      devider
    }
  }
  
  private var devider: some View {
    HStack {
      spacer
      Rectangle()
        .frame(width: UIScreen.main.bounds.width / 1.6, height: 1)
        .foregroundColor(Color(.systemGray6))
      spacer
    }
  }
  
  private var spacer: some View {
    Spacer()
  }
  
}

// struct DetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    DetailView()
//  }
// }
