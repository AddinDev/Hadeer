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
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserResponsesContainer, Error>
  func fetchTasks(_ user: UserModel) -> AnyPublisher<TaskResponses, Error>
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String) -> AnyPublisher<DefaultResponse, Error>
}

final class RemoteDataSource {
  
  init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func signIn(_ username: String, _ password: String) -> AnyPublisher<UserResponsesContainer, Error> {
    return Future<UserResponsesContainer, Error> { completion in
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
              print("[SUCCESS]")
              completion(.success(result))
            } catch {
              print("[ERROR][SIGNIN]")
              debugPrint(error)
              completion(.failure(URLError.custom("Wrong credentials")))
            }
          } else {
            completion(.failure(URLError.invalidResponse))
          }
        }
        task.resume()
      
      }
    .eraseToAnyPublisher()
  }
  
  func fetchTasks(_ user: UserModel) -> AnyPublisher<TaskResponses, Error> {
    return Future<TaskResponses, Error> { completion in
      print("[FETCH STUDENT TASK]")
      
      var components = URLComponents(string: user.isStudent() ? Api.studentTasks : Api.teacherTasks)
      components?.queryItems = [
        user.isStudent() ? URLQueryItem(name: "kelas", value: user.grade) : URLQueryItem(name: "guruid", value: user.id)
      ]
      
      guard let urlString = components?.string else { return }
      guard let url = URL(string: urlString) else { return }
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
          print("[ERROR FETCH TASK][\(error.localizedDescription)]")
          completion(.failure(error))
          return
        }
        if let data = data {
          do {
            let result = try JSONDecoder().decode(TaskResponsesContainer.self, from: data)
            completion(.success(result.result))
            print("[SUCCESS]")
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
  
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String) -> AnyPublisher<DefaultResponse, Error> {
    return Future<DefaultResponse, Error> { completion in
      print("[ATTEND]")
      
      let body: [String: Any] = [
        "siswa_id": studentId,
        "pelajaran_id": taskId,
        "guru_id": teacherId,
        "status": "1"
      ]

      let jsonData = try? JSONSerialization.data(withJSONObject: body)
      
      let components = URLComponents(string: Api.attend)
      
      guard let urlString = components?.string else { return }
      guard let url = URL(string: urlString) else { return }
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.httpBody = jsonData
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
          print("[ERROR ATTEND][\(error.localizedDescription)]")
          completion(.failure(error))
          return
        }
        if let data = data {
          do {
            let result = try JSONDecoder().decode(DefaultResponse.self, from: data)
            completion(.success(result))
            print("[SUCCESS]")
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
