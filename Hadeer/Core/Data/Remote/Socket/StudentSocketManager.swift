//
//  StudentSocketManager.swift
//  Hadeer
//
//  Created by Addin Satria on 07/04/22.
//

import Foundation
import SocketIO
import SwiftUI

class StudentSocketManager: LocalNotificationManager {
  
  @Published var frames: [String] = []
  static let sharedInstance = StudentSocketManager()
  
  let manager = SocketManager(socketURL: URL(string: Api.baseUrl)!)
  
  var socket: SocketIOClient!
  
  override init() {
    super.init()
    
    socket = manager.defaultSocket
    
    socket.on(clientEvent: .connect) { _, _ in
      self.receive()
    }

    self.establishConnection()
  }
  
  func login(_ id: String) {
    print("[SOCKET LOGIN][\(id)]")
    socket.emit("login", id)
  }
  
  func establishConnection() {
    socket.connect()
    print("[SOCKET][CONNECTED]")
  }
  
  func receive() {
    print("Receiving Data")
    socket.on("notification") { data, _ in
      if let data = data as? [String] {
//        self.frames = data
        self.sendNotification(title: data[0], subtitle: nil, body: "hehe", launchIn: 4.0)
      }
      print("[SOCKET][MSG][\(data[0])]")
    }
  }
  
  func closeConnection() {
    socket.disconnect()
    print("[SOCKET][DISCONNECTED]")
  }
}
