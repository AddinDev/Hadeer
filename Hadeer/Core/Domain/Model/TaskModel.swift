//
//  TaskModel.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct TaskModel: Identifiable {
  let id: String
  let nama: String
  let kelas: String
  let guruID: String
  let waktu: String
  let materi: String
}

typealias TaskModels = [TaskModel]
