//
//  TaskMapper.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct TaskMapper {
  
  static func responseToDomain(_ responses: TaskResponses) -> [TaskModel] {
    return responses.map { response in
      return TaskModel(id: response.id, title: response.nama, grade: response.kelas, teacherName: response.namaGuru, teacherId: response.guruID, time: response.waktu, material: response.materi, students: studentsResponseToModel(response.siswa))
    }
  }
  
  static private func studentsResponseToModel(_ response: [StudentsOfTaskResponse]) -> [StudentsOfTaskModel] {
    response.map { response in
      return StudentsOfTaskModel(id: response.idSiswa, name: response.namaSiswa, status: response.status ?? "0")
    }
  }
  
}
