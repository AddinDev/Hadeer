//
//  HomePresenter.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  @Published var tasks: [TaskModel] = []
  
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let router = HomeRouter()
  
  let useCase: HomeUseCase
  
  init(_ useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
  func fetchTasks(_ user: UserModel) {
    isLoading = true
    if user.isStudent() {
      fetchStudentTasks(user)
    } else {
      fetchTeacherTasks(user)
    }
  }
  
  func fetchStudentTasks(_ user: UserModel) {
    print("[USER][\(user)]")
    tasks = []
    useCase.fetchStudentTasks(user)
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
  
  func fetchTeacherTasks(_ user: UserModel) {
    print("[USER][\(user)]")
    tasks = []
    useCase.fetchTeacherTasks(user)
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
