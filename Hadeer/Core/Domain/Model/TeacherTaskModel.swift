//
//  TeacherTaskModel.swift
//  Hadeer
//
//  Created by Addin Satria on 21/03/22.
//

import Foundation

struct TeacherTaskModel: Identifiable, TaskModel {
  let id: String
  let title: String
  let grade: String
  let teacherName: String
  let teacherId: String
  let time: String
  let material: String
  let students: [StudentsOfTeacherModel]
}

typealias TeacherTaskModels = [TeacherTaskModel]

struct StudentsOfTeacherModel: Identifiable {
  let id: String
  let name: String
}
