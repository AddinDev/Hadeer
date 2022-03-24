//
//  SignerUserCase.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation
import Combine

protocol SignerUseCase {

  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserModel, Error>

}

class SignerInteractor {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension SignerInteractor: SignerUseCase {

  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserModel, Error> {
    self.repository.signIn(username, password)
  }
  
}
