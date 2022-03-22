//
//  UserAuthentication.swift
//  Hadeer
//
//  Created by Addin Satria on 08/03/22.
//

import Foundation

struct UserAuthentication: Codable {
  
  var hasSignedIn: Bool = false
  var id: String = "0"
  var name: String = ""
  var username: String = ""
  var email: String = ""
  var password: String = ""
  var token: String = ""
  var image: String = ""
  var roles: String = "0"
  var grade: String = ""
  
  func isStudent() -> Bool {
    if roles == "1" {
      return true
    }
    return false
  }
  
}
