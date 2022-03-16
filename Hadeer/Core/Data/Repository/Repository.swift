//
//  Repository.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol RepositoryProtocol {
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error>
  func signIn(_ username: String, _ password: String) -> AnyPublisher<DefaultResponse, Error>
  func fetchTasks(_ username: String) -> AnyPublisher<TaskModels, Error>

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
  
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error> {
    self.remote.signUp(username, email, phone, password)
  }
  
  func signIn(_ username: String, _ password: String) -> AnyPublisher<DefaultResponse, Error> {
    self.remote.signIn(username, password)
  }
  
  func fetchTasks(_ username: String) -> AnyPublisher<TaskModels, Error> {
    self.remote.fetchTasks(username)
      .map { TaskMapper.responseToDomain(responses: $0) }
      .eraseToAnyPublisher()
  }
  
}
