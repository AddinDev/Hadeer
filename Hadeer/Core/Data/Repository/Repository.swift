//
//  Repository.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine

protocol RepositoryProtocol {
  
}

final class Repository {
  
  typealias Repo = (RemoteDataSource) -> Repository
  
  fileprivate var remote: RemoteDataSourceProtocol
  
  init(remote: RemoteDataSourceProtocol) {
    self.remote = remote
  }
  
  static let sharedInstance: Repo = { remote in
    return Repository(remote: remote)
  }
  
}

extension Repository: RepositoryProtocol {
  
}
