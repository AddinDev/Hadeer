//
//  AttendanceMapper.swift
//  Hadeer
//
//  Created by Addin Satria on 24/03/22.
//

import Foundation

struct AttendanceMapper {
  
  static func responseToDomain(_ responses: AttendanceResponses) -> AttendanceModels {
    return responses.map { response in
      return AttendanceModel(id: response.id, taskId: response.pelajaranID, teacherId: response.guruID, studentId: response.siswaID, studentName: response.namaSiswa, time: response.timestamps, status: response.status)
    }
  }
  
}
