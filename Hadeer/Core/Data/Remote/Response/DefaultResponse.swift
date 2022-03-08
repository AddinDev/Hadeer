//
//  DefaultResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation

struct DefaultResponse: Codable {
  let status: String
  let message: String?
  let status_code: Int
}
