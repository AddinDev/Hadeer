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
  
  func attend(id: String, _ status: Int, action: @escaping (Bool, Bool) -> Void) {
    isLoading = true
    action(false, true)
    self.useCase.attend(task.id, task.teacherId, id, status)
      .receive(on: RunLoop.main)
      .sink { completion in
        switch completion {
          case .finished:
            self.isLoading = false
            self.isError = false
            self.errorMessage = ""
            action((status != 0), false)
          case .failure(let error):
            self.isLoading = false
            self.isError = true
            self.errorMessage = error.localizedDescription
        }
      } receiveValue: { _ in
      }
      .store(in: &cancellables)
  }
  // BACKEND GJLS
  func fetchAttendance() {
    isLoading = true
    self.useCase.fetchAttendance(task.id)
      .receive(on: RunLoop.main)
      .sink { completion in
        switch completion {
          case .finished:
            self.isLoading = false
            self.isError = false
            self.errorMessage = ""
          case .failure(let error):
            self.isLoading = false
            self.isError = true
            self.errorMessage = error.localizedDescription
        }
      } receiveValue: { value in
        print("[FETCH ATTENDANCE][VALUE][\(value)]")
      }
      .store(in: &cancellables)
  }
  
}
