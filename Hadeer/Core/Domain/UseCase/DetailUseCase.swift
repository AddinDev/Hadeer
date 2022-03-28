//
//  DetailUseCase.swift
//  Hadeer
//
//  Created by Addin Satria on 16/03/22.
//

import Foundation
import Combine

protocol DetailUseCase {
  func getTask() -> TaskModel
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String, _ status: Int) -> AnyPublisher<DefaultResponse, Error>
  func fetchAttendance(_ id: String) -> AnyPublisher<AttendanceModels, Error>
}

class DetailInteractor {
  
  private let repository: Repository
  
  private let task: TaskModel
  
  init(repository: Repository, task: TaskModel) {
    self.repository = repository
    self.task = task
  }
  
}

extension DetailInteractor: DetailUseCase {
  
  func getTask() -> TaskModel {
    return self.task
  }
  
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String, _ status: Int) -> AnyPublisher<DefaultResponse, Error> {
    return repository.attend(taskId, teacherId, studentId, status)
  }
  
  func fetchAttendance(_ id: String) -> AnyPublisher<AttendanceModels, Error> {
    return repository.fetchAttendance(id)
  }
  
}
