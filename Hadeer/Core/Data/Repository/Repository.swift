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
  func fetchStudentTasks(_ user: UserModel) -> AnyPublisher<StudentTaskModels, Error>
  func fetchTeacherTasks(_ user: UserModel) -> AnyPublisher<TeacherTaskModels, Error>
  
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
  
//  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error> {
//    self.remote.signUp(username, email, phone, password)
//  }
  
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserModel, Error> {
    self.remote.signIn(username, password)
      .map { UserMapper.responseToDomain(response: $0) }
      .eraseToAnyPublisher()
  }
  
  func fetchStudentTasks(_ user: UserModel) -> AnyPublisher<StudentTaskModels, Error> {
    self.remote.fetchStudentTasks(user)
      .map { TaskMapper.studentResponseToDomain($0) }
      .eraseToAnyPublisher()
  }
  
  func fetchTeacherTasks(_ user: UserModel) -> AnyPublisher<TeacherTaskModels, Error> {
    self.remote.fetchTeacherTasks(user)
      .map { TaskMapper.teacherResponseToDomain($0) }
      .eraseToAnyPublisher()
  }
  
}
