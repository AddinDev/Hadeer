//
//  HomeUseCase.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol HomeUseCase {
  func fetchTasks(_ user: UserModel) -> AnyPublisher<TaskModels, Error>
}

class HomeIntercator {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension HomeIntercator: HomeUseCase {
  
  func fetchTasks(_ user: UserModel) -> AnyPublisher<TaskModels, Error> {
    self.repository.fetchTasks(user)
  }

}
