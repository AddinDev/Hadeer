//
//  UserResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 18/03/22.
//

import Foundation

struct UserResponsesContainer: Codable {
    let status: String
    let statusCode: Int
    let result: UserResponse
    let message: String

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case result, message
    }
}

struct UserResponse: Codable {
    let id, username, password, email: String?
    let token: String?
    let image: String?
    let roles, nama, kelas: String?
}
