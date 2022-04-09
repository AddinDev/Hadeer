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
  var status: String
  let students: [StudentsOfTaskModel]
  
  func color() -> Color {
    switch status {
      case "1": return .cgreen
      case "2": return .cblue
      case "3": return .cred
      default: return .gray
    }
  }
  
  func statusDesc() -> TaskStatus {
    switch status {
      case "1": return .hadir
      case "2": return .izin
      case "3": return .alpha
      default:
        return .general
    }
  }
  
}

typealias TaskModels = [TaskModel]

struct StudentsOfTaskModel: Identifiable {
  let id: String
  let name: String
  let status: String
  
  func isAttended() -> Bool {
    if status != "0" {
      return true
    }
    return false
  }
  
  func statusDesc() -> TaskStatus {
    switch status {
      case "1": return .hadir
      case "2": return .izin
      case "3": return .alpha
      default:
        return .general
    }
  }
  
}

enum TaskStatus: String {
  
  case general
  case hadir
  case izin
  case alpha
  
  var description: String {
    switch self {
      case .hadir:
        return "Hadir"
      case .izin:
        return "Izin"
      case .alpha:
        return "Alpha"
      case .general:
        return "Not Attended"
    }
  }
  
}
