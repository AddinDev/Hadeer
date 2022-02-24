//
//  HomePresenter.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  let useCase: HomeUseCase
  
  init(_ useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
}
