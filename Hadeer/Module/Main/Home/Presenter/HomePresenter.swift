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
  
  @Published var hadir = 0
  @Published var alpha = 0
  @Published var izin = 0
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let router = HomeRouter()
  
  let useCase: HomeUseCase
  
  init(_ useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
  func fetchTasks(_ user: UserModel) {
    isLoading = true
    print("[USER][\(user)]")
    useCase.fetchTasks(user)
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
//        self.tasks = []
        self.tasks = tasks.sorted(by: { $0.id > $1.id })
        self.hadir = tasks.filter({$0.status == "1"}).count
        self.izin = tasks.filter({$0.status == "2"}).count
        self.alpha = tasks.filter({$0.status == "3"}).count
      }
      .store(in: &cancellables)
  }
  
  func linkBuilder<Content: View>(for task: TaskModel, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: router.makeDetailView(for: task)) { content() }
  }
  
}
