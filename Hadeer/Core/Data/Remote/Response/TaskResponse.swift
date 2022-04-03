//
//  TaskResponse.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct TaskResponsesContainer: Codable {
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
  let namaGuru: String
  let siswa: [StudentsOfTaskResponse]?
  let status: String?
  
  enum CodingKeys: String, CodingKey {
    case id, nama, kelas
    case guruID = "guru_id"
    case waktu, materi
    case namaGuru = "nama_guru"
    case siswa
    case status
  }
}

typealias TaskResponses = [TaskResponse]

struct StudentsOfTaskResponse: Codable {
  let idSiswa: String
  let namaSiswa: String
  let status: String?
  
  enum CodingKeys: String, CodingKey {
    case idSiswa = "id_siswa"
    case namaSiswa = "nama_siswa"
    case status
  }
}
