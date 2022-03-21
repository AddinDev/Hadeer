//
//  TaskModel.swift
//  Hadeer
//
//  Created by Addin Satria on 21/03/22.
//

import Foundation

protocol TaskModel {
  var id: String { get }
  var title: String { get }
  var grade: String { get }
  var teacherName: String { get }
  var teacherId: String { get }
  var time: String { get }
  var material: String { get }
}

