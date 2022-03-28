//
//  AttendanceResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 24/03/22.
//

import Foundation

struct AttendanceResponseContainer: Codable {
    let status: String
    let statusCode: Int
    let result: [AttendanceResponse]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case result
    }
}

typealias AttendanceResponses = [AttendanceResponse]

struct AttendanceResponse: Codable {
    let id, pelajaranID, siswaID, status: String
    let guruID, timestamps, namaSiswa: String

    enum CodingKeys: String, CodingKey {
        case id
        case pelajaranID = "pelajaran_id"
        case siswaID = "siswa_id"
        case status
        case guruID = "guru_id"
        case timestamps
        case namaSiswa = "nama_siswa"
    }
}
