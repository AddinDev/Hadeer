//
//  TaskModel.swift
//  Hadeer
//
//  Created by Addin Satria on 11/03/22.
//

import Foundation

struct StudentTaskModel: TaskModel {
  let id: String
  let title: String
  let grade: String
  let teacherName: String
  let teacherId: String
  let time: String
  let material: String
  let studentName: [String]
  let studentId: [String]
}

typealias StudentTaskModels = [StudentTaskModel]
