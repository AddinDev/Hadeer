//
//  SignUpAuthorizationModel.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation

struct SignUpAuthorizationModel: Encodable {
  let serverkey: String
  let username: String
  let password: String
  let email: String
  let phone: String
}
