//
//  Encode.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation

extension Encodable {
  
  func encryptAndEncode() -> String {
    guard let encodedData = try? JSONEncoder().encode(self) else { return "" }
    if let jsonString = String(data: encodedData, encoding: .utf8) {
      let base = Data(jsonString.utf8).base64EncodedString()
      print("[ENCODED AUTH]: \(base)")
      return base
    }
    return ""
  }
  
}
