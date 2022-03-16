//
//  HomePresenter.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  @Published var tasks: TaskModels = []
  
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let router = HomeRouter()
  
  let useCase: HomeUseCase
  
  init(_ useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
  func fetchTasks() {
    isLoading = true
    useCase.fetchTasks("")
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
      } receiveValue: { tasks in
        self.tasks = tasks
      }
      .store(in: &cancellables)
  }
  
  func linkBuilder<Content: View>(for task: TaskModel, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: router.makeDetailView(for: task)) { content() }
  }
  
}
