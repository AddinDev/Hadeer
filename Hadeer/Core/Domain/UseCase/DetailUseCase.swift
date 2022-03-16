//
//  DetailUseCase.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import Foundation
import Combine

protocol DetailUseCase {
  func getTask() -> TaskModel
}

class DetailInteractor {
  
  private let repository: Repository
  
  private let task: TaskModel
  
  init(repository: Repository, task: TaskModel) {
    self.repository = repository
    self.task = task
  }
  
}

extension DetailInteractor: DetailUseCase {
  
  func getTask() -> TaskModel {
    return self.task
  }
  
}
