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
    outputFormat.dateFormat = "EEEE, d MMMM"
    
    if let date = inputFormat.date(from: self) {
      let result = outputFormat.string(from: date)
      return result
    }
    print("[ERROR DATE][FORMATTING]")
    return ""
  }
  
  func formatToHour() -> String {
    let inputFormat = DateFormatter()
    inputFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    let outputFormat = DateFormatter()
    outputFormat.dateFormat = "h:mm a"
    
    if let date = inputFormat.date(from: self) {
      let result = outputFormat.string(from: date)
      return result
    }
    print("[ERROR DATE][FORMATTING]")
    return ""
  }
  
  func toDate() -> Date {
    let inputFormat = DateFormatter()
    inputFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    if let date = inputFormat.date(from: self) {
      return date
    }
    return Date()
  }
  
}
