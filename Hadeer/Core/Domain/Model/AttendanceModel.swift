//
//  AttendanceModel.swift
//  Hadeer
//
//  Created by Addin Satria on 24/03/22.
//

import Foundation

struct AttendanceModel: Identifiable {
  let id: String
  let taskId: String
  let teacherId: String
  let studentId: String
  let studentName: String
  let time: String
  let status: String
}

typealias AttendanceModels = [AttendanceModel]
