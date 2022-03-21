//
//  CommentResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 21/03/22.
//

import Foundation

struct CommentResponsesContainer: Codable {
    let status: String
    let statusCode: Int
    let result: [CommentResponse]
    let message: String

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case result, message
    }
}

// MARK: - Result
struct CommentResponse: Codable {
    let id, message, userID, timestamps: String
    let parentID, pelajaranID, namaSiswa: String

    enum CodingKeys: String, CodingKey {
        case id, message
        case userID = "user_id"
        case timestamps
        case parentID = "parent_id"
        case pelajaranID = "pelajaran_id"
        case namaSiswa = "nama_siswa"
    }
}
