//
//  HomeUseCase.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol HomeUseCase {
  func fetchTasks(_ username: String) -> AnyPublisher<TaskModels, Error>

}

class HomeIntercator {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension HomeIntercator: HomeUseCase {
  
  func fetchTasks(_ username: String) -> AnyPublisher<TaskModels, Error> {
    return repository.fetchTasks(username)
  }

}
