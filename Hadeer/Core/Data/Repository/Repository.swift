//
//  Repository.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol RepositoryProtocol {
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<Bool, Error>

}

final class Repository {
  
  typealias Repo = (RemoteDataSource) -> Repository
  
  fileprivate var remote: RemoteDataSourceProtocol
  
  init(remote: RemoteDataSourceProtocol) {
    self.remote = remote
  }
  
  static let sharedInstance: Repo = { remote in
    return Repository(remote: remote)
  }
  
}

extension Repository: RepositoryProtocol {
  
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<Bool, Error> {
    self.remote.signUp(username, email, phone, password)
  }
  
}
