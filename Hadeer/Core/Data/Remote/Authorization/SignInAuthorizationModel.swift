//
//  SignInAuthorizationModel.swift
//  Hadeer
//
//  Created by Addin Satria on 02/03/22.
//

import Foundation

struct SignInAuthorizationModel: Encodable {
  let serverkey: String
  let username: String
  let password: String
}
