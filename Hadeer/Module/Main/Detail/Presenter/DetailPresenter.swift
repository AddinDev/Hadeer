//
//  DetailPresenter.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
  
  @Published var task: TaskModel
  
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let useCase: DetailUseCase
  
  init(useCase: DetailUseCase) {
    self.useCase = useCase
    self.task = useCase.getTask()
  }
  
  func attend(id: String, action: @escaping (Bool, Bool) -> Void) {
    isLoading = true
    action(false, true)
    print("[ATTEND STUDENT][\(id)]")
    self.useCase.attend(task.id, task.teacherId, id)
      .receive(on: RunLoop.main)
      .sink { completion in
        switch completion {
          case .finished:
            self.isLoading = false
            self.isError = false
            self.errorMessage = ""
            action(true, false)
          case .failure(let error):
            self.isLoading = false
            self.isError = true
            self.errorMessage = error.localizedDescription
        }
      } receiveValue: { _ in
      }
      .store(in: &cancellables)
  }
  
}
