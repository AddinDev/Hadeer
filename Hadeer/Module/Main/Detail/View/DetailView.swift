//
//  DetailView.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI

struct DetailView: View {
  @EnvironmentObject var auth: Authentication
  @StateObject var presenter: DetailPresenter
  var body: some View {
    content
    //      .onAppear {
    //        presenter.fetchAttendance()
    //      }
    //        .navigationBarHidden(true)
  }
}

extension DetailView {
  
  private var content: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 0) {
        bar
        status
        sections
        spacer
        if !auth.savedUser.isStudent() {
          students
        }
      }
    }
    .edgesIgnoringSafeArea(.bottom)
    //    .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1))
  }
  
  private var image: some View {
    Image("ph")
      .resizable()
      .scaledToFit()
  }
  private var bar: some View {
    presenter.color
      .frame(width: UIScreen.main.bounds.width, height: 30)
  }
  
  private var status: some View {
    HStack {
      VStack {
        Text(presenter.task.title)
        Text(presenter.task.material)
      }
      .padding()
      Rectangle()
        .frame(width: 1, height: 50)
        .foregroundColor(Color(.systemGray6))
      Text(presenter.task.teacherName)
        .padding()
      Rectangle()
        .frame(width: 1, height: 50)
        .foregroundColor(Color(.systemGray6))
      VStack {
        Text(presenter.task.statusDesc().description)
        Text(presenter.task.time.formatToDate())
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
        Text(presenter.task.time.formatToHour())
        Spacer()
      }
      .padding()
      .padding(.vertical, 20)
      .frame(width: UIScreen.main.bounds.width)
      devider
      //      VStack {
      //        HStack {
      //          Text("Materi: ")
      //            .bold()
      //          Text("[Link](https://saweria.co/udinda)")
      //          Spacer()
      //        }
      //        LinkPreview(url: URL(string: "https://github.com/AddinDev/Komm"))
      //          .frame(width: UIScreen.main.bounds.width / 1.2)
      //      }
      //      .padding()
      //      .padding(.vertical, 20)
      //      .frame(width: UIScreen.main.bounds.width)
      //      devider
      //      VStack {
      //        HStack {
      //          Text("Absensi: ")
      //            .bold()
      //          Text("[Link](https://apple.com)")
      //          Spacer()
      //        }
      //        LinkPreview(url: URL(string: "https://github.com/AddinDev/coronaX"))
      //          .frame(width: UIScreen.main.bounds.width / 1.2)
      //      }
      //      .padding()
      //      .padding(.vertical, 20)
      //      .frame(width: UIScreen.main.bounds.width)
      //      devider
    }
  }
  
  private var students: some View {
    VStack {
      ForEach(presenter.task.students) { student in
        StudentView(presenter: presenter, student: student)
      }
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
  
  private var time: String {
    if let date = DateFormatter().date(from: presenter.task.time) {
      return "\(Date().distance(to: date))"
    }
    return ""
  }
  
}

struct StudentView: View {
  @EnvironmentObject var tsm: TeacherSocketManager
  @StateObject var presenter: DetailPresenter
  var student: StudentsOfTaskModel
  @State private var isLoading: Bool = false
  @State private var isAttended: Bool = false
  @State private var status = "0"
  @State private var statusDescription = ""
  var body: some View {
    HStack {
      Text(student.name)
      Spacer()
      if isAttended {
        Text(statusDescription)
          .foregroundColor(color(status))
          .onTapGesture {
           attend(0)
          }
      } else if isLoading {
        ProgressView().progressViewStyle(CircularProgressViewStyle())
      } else {
        Menu("Attend") {
          Button("Attended") { attend(1) }
          Button("Izin") { attend(2) }
          Button("Alpha") { attend(3)
            tsm.sendNotification(student.id, "Jangan sering Alpha ya")
          }
        }
        //        Button(action: {
        //          presenter.attend(id: student.id, 1) { attended, loading in
        //            isAttended = attended
        //            isLoading = loading
        //          }
        //        }) {
        //          Text("Attend")
        //        }
      }
    }
    .padding()
    .onAppear {
      isAttended = student.isAttended()
      status = student.status
      statusDescription = student.statusDesc().description
    }
  }
  
  private func attend(_ code: Int) {
    presenter.attend(id: student.id, code) { attended, loading in
      isAttended = attended
      isLoading = loading
    }
    status = String(code)
    statusDescription = statusDesc(String(code))
  }
  
  private func statusDesc(_ status: String) -> String {
    switch status {
      case "1": return "Hadir"
      case "2": return "Izin"
      case "3": return "Alpha"
      default:
        return "Attend"
    }
  }
  
  private func color(_ status: String) -> Color {
    switch status {
      case "1": return .cgreen
      case "2": return .cblue
      case "3": return .cred
      default: return .gray
    }
  }
  
}

// struct DetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    DetailView()
//  }
// }
