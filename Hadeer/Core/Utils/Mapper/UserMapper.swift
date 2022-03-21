//
//  UserMapper.swift
//  Hadeer
//
//  Created by Addin Satria on 18/03/22.
//

import Foundation

struct UserMapper {
  
  static func responseToDomain(response: UserResponse) -> UserModel {
    return UserModel(id: response.id ?? "",
                     username: response.username ?? "",
                     name: response.nama ?? "",
                     email: response.email ?? "",
                     password: response.password ?? "",
                     token: response.token ?? "",
                     image: response.image ?? "",
                     roles: response.roles ?? "",
                     grade: response.kelas ?? "")
  }
  
}
