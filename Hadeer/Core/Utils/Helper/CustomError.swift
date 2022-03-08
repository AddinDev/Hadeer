//
//  CustomError.swift
//  Hadeer
//
//  Created by Addin Satria on 08/03/22.
//

import Foundation

enum URLError: LocalizedError {

  case invalidResponse
  case addressUnreachable(URL)
  case custom(String)
  
  var errorDescription: String? {
    switch self {
    case .invalidResponse: return "The server responded with garbage."
    case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    case .custom(let error): return "\(error)"
    }
  }

}
