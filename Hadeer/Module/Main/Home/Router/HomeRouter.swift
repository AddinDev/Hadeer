//
//  HomeRouter.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import SwiftUI

struct HomeRouter {
  
  func makeDetailView(for task: TaskModel, color: Color) -> some View {
    let useCase = Injection.init().provideDetail(task: task)
    let presenter = DetailPresenter(useCase: useCase, color: color)
    return DetailView(presenter: presenter)
  }
  
}
