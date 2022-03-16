//
//  HomeRouter.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import SwiftUI

struct HomeRouter {
  
  func makeDetailView(for task: TaskModel) -> some View {
    let useCase = Injection.init().provideDetail(task: task)
    let presenter = DetailPresenter(useCase: useCase)
    return DetailView(presenter: presenter)
  }
  
}
