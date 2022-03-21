//
//  PelajaranKelasResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 18/03/22.
//

import Foundation

struct StudentTaskResponsesContainer: Codable {
    let status: String
    let statusCode: Int
    let result: [StudentTaskResponse]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case result
    }
}

struct StudentTaskResponse: Codable {
    let id, nama, kelas, guruID: String
    let waktu, materi: String
    let namaGuru: String
    let idSiswa: [String]
    let namaSiswa: [String]

    enum CodingKeys: String, CodingKey {
        case id, nama, kelas
        case guruID = "guru_id"
        case waktu, materi
        case namaGuru = "nama_guru"
        case idSiswa = "id_siswa"
        case namaSiswa = "nama_siswa"
    }
}

typealias StudentTaskResponses = [StudentTaskResponse]
