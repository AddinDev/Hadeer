//
//  TaskMapper.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct TaskMapper {
  
  static func studentResponseToDomain(_ responses: StudentTaskResponses) -> [StudentTaskModel] {
    return responses.map { response in
      return StudentTaskModel(id: response.id, title: response.nama, grade: response.kelas, teacherName: response.namaGuru, teacherId: response.guruID, time: response.waktu.formatToDate(), material: response.materi, studentName: response.namaSiswa, studentId: response.idSiswa)
    }
  }
  
  static func teacherResponseToDomain(_ responses: TeacherTaskResponses) -> TeacherTaskModels {
    return responses.map { response in
      return TeacherTaskModel(id: response.id, title: response.nama, grade: response.kelas, teacherName: response.namaGuru, teacherId: response.guruID, time: response.waktu.formatToDate(), material: response.materi, students: studentsResponseToModel(response.siswa))
    }
  }
  
  static private func studentsResponseToModel(_ response: [StudentsOfTeacherResponse]) -> [StudentsOfTeacherModel] {
    response.map { response in
      return StudentsOfTeacherModel(id: response.idSiswa, name: response.namaSiswa)
    }
  }
  
}
