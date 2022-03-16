//
//  String.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import Foundation

extension String {
  func formatToDate() -> String {
    let inputFormat = DateFormatter()
    inputFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    let outputFormat = DateFormatter()
    outputFormat.dateFormat = "dd-MM-yy"
    
    if let date = inputFormat.date(from: self) {
      let result = outputFormat.string(from: date)
      return result
    }
    print("TASKERROR: DATE FORMATTING")
    return ""
  }
}
