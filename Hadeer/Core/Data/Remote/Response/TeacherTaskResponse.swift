//
//  PelajaranGuruResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 18/03/22.
//

import Foundation

struct TeacherTaskResponsesContainer: Codable {
    let status: String
    let statusCode: Int
    let result: [TeacherTaskResponse]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case result
    }
}

struct TeacherTaskResponse: Codable {
    let id, nama, kelas, guruID: String
    let waktu, materi: String
    let namaGuru: String
    let siswa: [StudentsOfTeacherResponse]

    enum CodingKeys: String, CodingKey {
        case id, nama, kelas
        case guruID = "guru_id"
        case waktu, materi
        case namaGuru = "nama_guru"
        case siswa
    }
}

typealias TeacherTaskResponses = [TeacherTaskResponse]

struct StudentsOfTeacherResponse: Codable {
    let idSiswa: String
    let namaSiswa: String

    enum CodingKeys: String, CodingKey {
        case idSiswa = "id_siswa"
        case namaSiswa = "nama_siswa"
    }
}
