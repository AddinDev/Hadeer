//
//  Api.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation

struct Api {
  static let ip = "192.168.20.246"
//  static let ip = "localhost"
  static let signIn = "http://\(ip):3000/api/login"
  static let signUp = "http://\(ip):3000/api/register"
  static let profile = ""
  static let studentTasks = "http://\(ip):3000/api/getpelajaranbykelas" // GET
  static let teacherTasks = "http://\(ip):3000/api/getpelajaranbyguruid"
  static let serverKey = "B1smill4hUJIKOM"
  
}
