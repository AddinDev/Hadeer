//
//  HomeUseCase.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation

protocol HomeUseCase {
  
}

class HomeIntercator {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension HomeIntercator: HomeUseCase {
  
}
