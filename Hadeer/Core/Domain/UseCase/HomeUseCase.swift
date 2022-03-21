//
//  HomeUseCase.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol HomeUseCase {
  func fetchStudentTasks(_ user: UserModel) -> AnyPublisher<StudentTaskModels, Error>
  func fetchTeacherTasks(_ user: UserModel) -> AnyPublisher<TeacherTaskModels, Error>
}

class HomeIntercator {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension HomeIntercator: HomeUseCase {
  
  func fetchStudentTasks(_ user: UserModel) -> AnyPublisher<StudentTaskModels, Error> {
    self.repository.fetchStudentTasks(user)
  }
  func fetchTeacherTasks(_ user: UserModel) -> AnyPublisher<TeacherTaskModels, Error> {
    self.repository.fetchTeacherTasks(user)
  }

}
