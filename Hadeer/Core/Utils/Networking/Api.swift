//
//  Api.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation

struct Api {
//  static let ip = "192.168.20.246"
  static let ip = "localhost"
  static let ipFathan = "http://192.168.21.154"
  static let baseUrl = "http://\(ip):3000"
  static let signIn = "\(ipFathan)/api/login"
  static let signUp = "\(ipFathan)/api/register"
  static let attend = "\(ipFathan)/api/attend"
  
  static let attendance = "\(ipFathan)/api/getattendancekelas"
  
  static func studentTasksId(_ id: String) -> String {
    "\(ipFathan)/api/getpelajaranbysiswaid?siswaid=\(id)"
  }
  static let teacherTasks = "\(ipFathan)/api/getpelajaranbyguruid"
  static func studentTasks(_ grade: String) -> String {
    "\(ipFathan)/api/getpelajaran?search=\(grade)"
  }
  static let serverKey = "B1smill4hUJIKOM"
  
}
