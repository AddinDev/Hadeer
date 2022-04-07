//
//  TeacherSocketManager.swift
//  Hadeer
//
//  Created by Addin Satria on 07/04/22.
//

import Foundation
import SocketIO
import SwiftUI

class TeacherSocketManager: NSObject, ObservableObject {
  
  @Published var frames: [String] = []
  static let sharedInstance = TeacherSocketManager()
  
  let manager = SocketManager(socketURL: URL(string: Api.baseUrl)!)
  
  var socket: SocketIOClient!
  
  override init() {
    super.init()
    
    socket = manager.defaultSocket
    
    socket.on(clientEvent: .connect) { _, _ in }

    self.establishConnection()
  }
  
  func sendNotification(_ id: String, _ message: String) {
    print("[SOCKET][SEND MSG][\(id)][\(message)]")
    socket.emit("notification", id, message)
  }
  
  func establishConnection() {
    socket.connect()
    print("[SOCKET][CONNECTED]")
  }
  
  func closeConnection() {
    socket.disconnect()
    print("[SOCKET][DISCONNECTED]")
  }
}
