//
//  SceneDelegate.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import UIKit
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
  
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    // Create the SwiftUI view that provides the window contents.
    let authentication = Authentication()

    let homeUseCase = Injection.init().provideHome()
    let homePresenter = HomePresenter(homeUseCase)
    
    let signerUseCase = Injection.init().provideSigner()
    let signerPresenter = SignerPresenter(signerUseCase)
    
    let ssm = StudentSocketManager.sharedInstance
    let tsm = TeacherSocketManager.sharedInstance
    
    let contentView = ContentView()
      .environmentObject(authentication)
      .environmentObject(signerPresenter)
      .environmentObject(homePresenter)
      .environmentObject(ssm)
      .environmentObject(tsm)

    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = HostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    // ...
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // ...
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // ...
  }

  // ...
}
