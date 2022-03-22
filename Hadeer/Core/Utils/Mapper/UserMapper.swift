//
//  UserMapper.swift
//  Hadeer
//
//  Created by Addin Satria on 18/03/22.
//

import Foundation

struct UserMapper {
  
  static func responseToDomain(container: UserResponsesContainer) -> UserModel {
    let response = container.result
    return UserModel(id: response.id ?? "",
                     username: response.username ?? "",
                     name: response.nama ?? "",
                     email: response.email ?? "",
                     password: response.password ?? "",
                     token: response.token ?? "",
                     image: response.image ?? "",
                     roles: response.roles ?? "",
                     grade: response.kelas ?? "", message: container.message)
  }
  
  static func domainToAuth(_ model: UserModel) -> UserAuthentication {
    return UserAuthentication(hasSignedIn: true, id: model.id, name: model.name, username: model.username, email: model.email, password: model.password, token: model.token, image: model.image, roles: model.roles, grade: model.grade)
  }
  
  static func authToDomain(_ auth: UserAuthentication) -> UserModel {
    return UserModel(id: auth.id, username: auth.username, name: auth.name, email: auth.email, password: auth.password, token: auth.token, image: auth.image, roles: auth.roles, grade: auth.grade, message: "")
  }
  
}
