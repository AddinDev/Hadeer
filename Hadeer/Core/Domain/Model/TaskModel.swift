//
//  TaskModel.swift
//  Hadeer
//
//  Created by Addin Satria on 21/03/22.
//

import Foundation

struct TaskModel: Identifiable {
  let id: String
  let title: String
  let grade: String
  let teacherName: String
  let teacherId: String
  let time: String
  let material: String
  let students: [StudentsOfTaskModel]
  
}

typealias TaskModels = [TaskModel]

struct StudentsOfTaskModel: Identifiable {
  let id: String
  let name: String
  let status: String
  
  func isAttended() -> Bool {
    if status == "1" {
      return true
    }
    return false
  }
  
}
