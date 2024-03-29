//
//  Injection.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation

final class Injection {
  
  private func provideRepository() -> Repository {
    let remote = RemoteDataSource.sharedInstance
    return Repository(remote: remote)
  }
  
  func provideSigner() -> SignerUseCase {
    return SignerInteractor(repository: provideRepository())
  }
  
  func provideHome() -> HomeUseCase {
    return HomeIntercator(repository: provideRepository())
  }
  
  func provideDetail(task: TaskModel) -> DetailUseCase {
    return DetailInteractor(repository: provideRepository(), task: task)
  }
  
}
