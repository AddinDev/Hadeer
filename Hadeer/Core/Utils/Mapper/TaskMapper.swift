//
//  TaskMapper.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct TaskMapper {
  
  static func responseToDomain(responses: TaskResponses) -> TaskModels {
    return responses.map { response in
      TaskModel(id: response.id,
                nama: response.nama,
                kelas: response.kelas,
                guruID: response.guruID,
                waktu: response.waktu,
                materi: response.materi)
    }
  }
  
}
