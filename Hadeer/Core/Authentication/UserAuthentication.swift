//
//  UserAuthentication.swift
//  Hadeer
//
//  Created by Addin Satria on 08/03/22.
//

import Foundation

class UserAuthentication: ObservableObject {
      
  @Published var username: String = ""
    
  init() {
    load()
  }
  
  func remove() {
    username = ""
    print("TASK: USER REMOVED")
  }
    
  func reload() {
    load()
  }
  
  func load() {
    username = "JOHN"
  }

}
