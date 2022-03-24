//
//  ContentView.swift
//  Hadeer
//
//  Created by Addin Satria on 22/02/22.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var authentication: Authentication

  @EnvironmentObject var signerPresenter: SignerPresenter
  @EnvironmentObject var homePresenter: HomePresenter
    
  var body: some View {
          NavigationView {
    //        TabView(selection: $selected) {
    Group {
      ZStack {
        if authentication.hasSignedIn {
          HomeView(presenter: homePresenter)
        } else {
          SignerView(presenter: signerPresenter)
        }
      }
    }
    .animation(.spring(response: 0.7, dampingFraction: 1, blendDuration: 1))

//              .navigationTitle("ehe")
            
//              .navigationBarHidden(true)
            }
    //      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
