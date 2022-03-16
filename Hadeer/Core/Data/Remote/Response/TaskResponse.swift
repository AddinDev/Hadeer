//
//  TaskResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct TaskResponseCollection: Codable {
    let status: String
    let statusCode: Int
    let result: [TaskResponse]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case result
    }
}

struct TaskResponse: Codable {
    let id, nama, kelas, guruID: String
    let waktu, materi: String

    enum CodingKeys: String, CodingKey {
        case id, nama, kelas
        case guruID = "guru_id"
        case waktu, materi
    }
}

typealias TaskResponses = [TaskResponse]
