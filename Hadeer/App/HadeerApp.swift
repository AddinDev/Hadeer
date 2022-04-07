//
//  HadeerApp.swift
//  Hadeer
//
//  Created by Addin Satria on 22/02/22.
//

import SwiftUI

@main
struct HadeerApp: App {
  @UIApplicationDelegateAdaptor var delegate: AppDelegate
  
  var body: some Scene {
    
    let authentication = Authentication()
    
    let homeUseCase = Injection.init().provideHome()
    let homePresenter = HomePresenter(homeUseCase)
    
    let signerUseCase = Injection.init().provideSigner()
    let signerPresenter = SignerPresenter(signerUseCase)
    
    let ssm = StudentSocketManager.sharedInstance
    let tsm = TeacherSocketManager.sharedInstance
    
    WindowGroup {
      ContentView()
        .environmentObject(authentication)
        .environmentObject(signerPresenter)
        .environmentObject(homePresenter)
        .environmentObject(ssm)
        .environmentObject(tsm)
    }
  }
}
