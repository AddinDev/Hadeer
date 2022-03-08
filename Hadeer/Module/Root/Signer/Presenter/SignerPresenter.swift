//
//  SignerPresenter.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation
import Combine

class SignerPresenter: ObservableObject {
  
  let useCase: SignerUseCase
  
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  private var cancellables: Set<AnyCancellable> = []
  
  init(_ useCase: SignerUseCase) {
    self.useCase = useCase
  }
  
}

extension SignerPresenter {
  
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) {
    isLoading = true
    useCase.signUp(username, email, phone, password)
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
            print(error.localizedDescription)
        }
      } receiveValue: { value in
        print("TASK LOGIN STATUS CODE: \(value.status_code) STATUS: \(value.status)")
      }
      .store(in: &cancellables)
  }
  
  func signIn(_ username: String, _ password: String) {
    isLoading = true
    useCase.signIn(username, password)
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
            print(error.localizedDescription)
        }
      } receiveValue: { value in
        print("TASK LOGIN STATUS CODE: \(value.status_code) STATUS: \(value.status)")
      }
      .store(in: &cancellables)
  }
  
}
