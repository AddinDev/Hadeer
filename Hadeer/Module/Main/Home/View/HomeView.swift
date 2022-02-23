//
//  HomeView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    content
  }
}

extension HomeView {
  
  private var content: some View {
    Text("Hello, World!")
  }
  
  private var spacer: some View {
    Spacer()
  }
  
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
