//
//  DetailPresenter.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import Foundation

class DetailPresenter: ObservableObject {
  
  @Published var task: TaskModel
    
  private let useCase: DetailUseCase
  
  init(useCase: DetailUseCase) {
    self.useCase = useCase
    self.task = useCase.getTask()
  }
}
