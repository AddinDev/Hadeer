//
//  ContentView.swift
//  Hadeer
//
//  Created by Addin Satria on 22/02/22.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  
  @State private var selected = 0
  
  var body: some View {
    //      NavigationView {
    //        TabView(selection: $selected) {
    
    ZStack {
      switch selected {
        case 0:
          SignerView(selected: $selected)
        case 1:
          NavigationView {
            HomeView(presenter: homePresenter)
          }
        default:
          EmptyView()
      }
    }
    
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
