//
//  Repository.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol RepositoryProtocol {
//  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error>
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserModel, Error>
  func fetchTasks(_ user: UserModel) -> AnyPublisher<TaskModels, Error>
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String) -> AnyPublisher<DefaultResponse, Error>
  
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
  
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserModel, Error> {
    self.remote.signIn(username, password)
      .map { UserMapper.responseToDomain(container: $0) }
      .eraseToAnyPublisher()
  }
  
  func fetchTasks(_ user: UserModel) -> AnyPublisher<TaskModels, Error> {
    self.remote.fetchTasks(user)
      .map { TaskMapper.responseToDomain($0) }
      .eraseToAnyPublisher()
  }
  
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String) -> AnyPublisher<DefaultResponse, Error> {
    self.remote.attend(taskId, teacherId, studentId)
  }
  
}
