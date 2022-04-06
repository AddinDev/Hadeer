//
//  TaskModel.swift
//  Hadeer
//
//  Created by Addin Satria on 21/03/22.
//

import Foundation
import SwiftUI

struct TaskModel: Identifiable {
  let id: String
  let title: String
  let grade: String
  let teacherName: String
  let teacherId: String
  let time: String
  let material: String
  let status: String
  let students: [StudentsOfTaskModel]
  
  func color() -> Color {
    switch status {
      case "1": return .cgreen
      case "2": return .cblue
      case "3": return .cred
      default: return .gray
    }
  }
  
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
