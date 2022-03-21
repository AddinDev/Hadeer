//
//  UserModel.swift
//  Hadeer
//
//  Created by Addin Satria on 18/03/22.
//

import Foundation

struct UserModel: Codable {
  let id: String
  let username: String
  let name: String
  let email: String
  let password: String
  let token: String
  let image: String
  var roles: String = "0"
  let grade: String
  
  func isStudent() -> Bool {
    if roles == "1" {
      return true
    }
    return false
  }
  
  func query() -> [String: String] {
    return isStudent() ? ["kelas": grade] : ["guruid": id]
  }
}
