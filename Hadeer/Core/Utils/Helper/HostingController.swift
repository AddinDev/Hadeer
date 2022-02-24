//
//  HostingController.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import SwiftUI

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}
