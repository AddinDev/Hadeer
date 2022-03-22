//
//  Authentication.swift
//  Hadeer
//
//  Created by Addin Satria on 08/03/22.
//

import Foundation

struct AuthDataStore {
  
  static let shared = AuthDataStore()
  private let key = "hadeer.saved.user"
  
  func save(_ user: UserAuthentication) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(user) {
      let defaults = UserDefaults.standard
      defaults.set(encoded, forKey: key)
    }
  }
  
  func load() -> UserAuthentication {
    let defaults = UserDefaults.standard
    if let savedUser = defaults.object(forKey: key) as? Data {
      let decoder = JSONDecoder()
      if let loadedUser = try? decoder.decode(UserAuthentication.self, from: savedUser) {
        return loadedUser
      }
    }
    return UserAuthentication() // instantiate a new User and return
    // if it's not stored previously
  }
  
  func removeUser() {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: key)
  }
  
}

class Authentication: ObservableObject {
  
  @Published var savedUser = AuthDataStore.shared.load()
  
  private var data = AuthDataStore.shared
  
  var hasSignedIn: Bool {
    get {
      savedUser.hasSignedIn
    }
    set(newHasSignedIn) {
      savedUser.hasSignedIn = newHasSignedIn
    }
  }
  
}

extension Authentication {
  
  func signIn() {
    self.savedUser.hasSignedIn = true
    data.save(savedUser)
  }
  
  func signOut() {
    self.savedUser.hasSignedIn = false
    data.removeUser()
  }
  
  func load() {
    savedUser = AuthDataStore.shared.load()
    data.save(savedUser)
  }
  
  func change(_ user: UserAuthentication) {
    savedUser = user
    data.save(savedUser)
  }
  
}
