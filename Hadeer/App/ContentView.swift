//
//  ContentView.swift
//  Hadeer
//
//  Created by Addin Satria on 22/02/22.
//

import SwiftUI

struct ContentView: View {
  
  @State private var selected = 0
  
    var body: some View {
      NavigationView {
//        TabView(selection: $selected) {
          SignInView()
          .navigationTitle("")
          .navigationBarHidden(true)
//        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
