//
//  NavigationBarModifier.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
  
  var backgroundColor: UIColor?
  var titleColor: UIColor?
  
  init(backgroundColor: UIColor?, titleColor: UIColor?) {
    self.backgroundColor = backgroundColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = backgroundColor
    
//    coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white,
//                                             .font: UIFont(name: "Quicksand-Bold", size: 18) as Any]
//    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white,
//                                                  .font: UIFont(name: "Quicksand-Bold", size: 18) as Any]
    
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
  }
  
  func body(content: Content) -> some View {
    ZStack {
      content
      VStack {
        GeometryReader { geometry in
          Color(self.backgroundColor ?? .clear)
            .frame(height: geometry.safeAreaInsets.top)
            .edgesIgnoringSafeArea(.top)
          Spacer()
        }
      }
    }
  }
}

extension View {
  
  func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
    self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
  }
  
}
