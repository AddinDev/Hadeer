//
//  SignerUserCase.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation
import Combine

protocol SignerUseCase {
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<Bool, Error>

}

class SignerInteractor {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension SignerInteractor: SignerUseCase {
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<Bool, Error> {
    self.repository.signUp(username, email, phone, password)
  }

}