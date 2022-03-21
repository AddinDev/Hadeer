//
//  RemoteDataSource.swift
//  Hadeer
//
//  Created by Addin Satria on 24/02/22.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol {
//  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error>
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserResponse, Error>
  func fetchStudentTasks(_ user: UserModel) -> AnyPublisher<StudentTaskResponses, Error>
  func fetchTeacherTasks(_ user: UserModel) -> AnyPublisher<TeacherTaskResponses, Error>

}

final class RemoteDataSource {
  
  init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserResponse, Error> {
    return Future<UserResponse, Error> { completion in
      print("[SIGN IN]")
      
      guard let url = URL(string: Api.signIn) else { return }
      let auth = SignInAuthorizationModel(serverkey: Api.serverKey,
                                          username: username,
                                          password: password).encryptAndEncode()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(auth, forHTTPHeaderField: "Authorization")
      
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
          if let error = error {
            print("[ERROR][SIGNIN][\(error.localizedDescription)]")
            completion(.failure(error))
            return
          }
          if let data = data {
            do {
              let result = try JSONDecoder().decode(UserResponsesContainer.self, from: data)
              completion(.success(result.result))
            } catch {
              completion(.failure(error))
            }
          } else {
            completion(.failure(URLError.custom("Data can't be initialized")))
          }
        }
        task.resume()
      
      }
    .eraseToAnyPublisher()
  }
  
  func fetchStudentTasks(_ user: UserModel) -> AnyPublisher<StudentTaskResponses, Error> {
    return Future<StudentTaskResponses, Error> { completion in
      print("[FETCH STUDENT TASK]")
      
      var components = URLComponents(string: Api.studentTasks)
      components?.queryItems = [
        URLQueryItem(name: "kelas", value: user.grade)
      ]
      guard let urlString = components?.string else { return }
      guard let url = URL(string: urlString) else { return }
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
          print("[ERROR FETCH STUDENT TASK][\(error.localizedDescription)]")
          completion(.failure(error))
          return
        }
        if let data = data {
          do {
            let result = try JSONDecoder().decode(StudentTaskResponsesContainer.self, from: data)
            completion(.success(result.result))
          } catch {
            completion(.failure(error))
          }
        } else {
          completion(.failure(URLError.custom("Data can't be initialized")))
        }
      }
      task.resume()
    }
    .eraseToAnyPublisher()
  }
  
  func fetchTeacherTasks(_ user: UserModel) -> AnyPublisher<TeacherTaskResponses, Error> {
    return Future<TeacherTaskResponses, Error> { completion in
      print("[FETCH TEACHER TASKS]")
      var components = URLComponents(string: Api.teacherTasks)
      components?.queryItems = [
        URLQueryItem(name: "guruid", value: user.id)
      ]
      guard let urlString = components?.string else { return }
      guard let url = URL(string: urlString) else { return }
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
          print("[ERROR FETCH TEACHER TASK][\(error.localizedDescription)]")
          completion(.failure(error))
          return
        }
        if let data = data {
          do {
            let result = try JSONDecoder().decode(TeacherTaskResponsesContainer.self, from: data)
            completion(.success(result.result))
          } catch {
            completion(.failure(error))
          }
        } else {
          completion(.failure(URLError.custom("Data can't be initialized")))
        }
      }
      task.resume()
    }
    .eraseToAnyPublisher()
  }
    
}
