//
//  ContentView.swift
//  Hadeer
//
//  Created by Addin Satria on 22/02/22.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var signerPresenter: SignerPresenter
  @EnvironmentObject var homePresenter: HomePresenter
  
  @State private var selected = 0
  
  var body: some View {
    //      NavigationView {
    //        TabView(selection: $selected) {
    Group {
      ZStack {
        switch selected {
          case 0:
            SignerView(presenter: signerPresenter, selected: $selected)
          case 1:
            NavigationView {
              HomeView(presenter: homePresenter)
            }
          default:
            EmptyView()
        }
      }
    }
    .animation(.spring(response: 0.7, dampingFraction: 1, blendDuration: 1))

    //          .navigationTitle("")
    //          .navigationBarHidden(true)
    //        }
    //      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
