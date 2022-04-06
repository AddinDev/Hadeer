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
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String, _ status: Int) -> AnyPublisher<DefaultResponse, Error>
  func fetchAttendance(_ id: String) -> AnyPublisher<AttendanceResponses, Error>
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
      
      // RESULT DOUBLE
      
      switch user.isStudent() {
        case true:
          let apis = [Api.studentTasks, Api.studentTasksId(user.id)]
          var tasks: TaskResponses = []
          for i in 0..<apis.count {
            var components = URLComponents(string: apis[i])
            components?.queryItems = [
              i == 0 ? URLQueryItem(name: "search", value: user.grade) : URLQueryItem(name: "siswaid", value: user.id)
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
//                  completion(.success(result.result))
//                  print("[SUCCESS]")
                  let final = result.result
                  if i == 0 {
                  tasks = final
                  } else {
                    for task in final {
                      tasks = tasks.filter({$0.id != task.id})
                      tasks.append(task)
                    }
                    completion(.success(tasks))
                  }
                } catch {
                  print("[ERROR FETCH TASK][\(error)]")
                  completion(.failure(error))
                }
              } else {
                completion(.failure(URLError.custom("Data can't be initialized")))
              }
            }
            task.resume()
          }
//          completion(.success(tasks))
        case false:
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
                print("[ERROR FETCH TASK][\(error)]")
                completion(.failure(error))
              }
            } else {
              completion(.failure(URLError.custom("Data can't be initialized")))
            }
          }
          task.resume()
      }
      
    }
    .eraseToAnyPublisher()
  }
  
  func attend(_ taskId: String, _ teacherId: String, _ studentId: String, _ status: Int) -> AnyPublisher<DefaultResponse, Error> {
    return Future<DefaultResponse, Error> { completion in
      
      let auth = "eyJzZXJ2ZXJrZXkiOiJCMXNtaWxsNGhVSklLT00iLCJ1c2VybmFtZSI6Im1ybmljayIsInBhc3N3b3JkIjoiTmlja3kxMjMifQo="
      
      let body: [String: Any] = [
        "siswa_id": Int(studentId) ?? 0,
        "pelajaran_id": Int(taskId) ?? 0,
        "guru_id": Int(teacherId) ?? 0,
        "status": status == 0 ? nil : status
      ]
      
      guard let url = URL(string: Api.attend) else {
        print("[ERROR][URL NOT VALID]")
        return
      }
      
      AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: ["Authorization": auth])
        .responseDecodable(of: DefaultResponse.self) { response in
          switch response.result {
            case .success(let value):
              print("[SUCCESS][ATTEND][\(studentId)][\(status)]")
              completion(.success(value))
            case .failure(let error):
              print("[ERROR][ATTEND][\(error.localizedDescription)]")
              completion(.failure(error))
          }
        }
    }
    .eraseToAnyPublisher()
  }
  
  func fetchAttendance(_ id: String) -> AnyPublisher<AttendanceResponses, Error> {
    return Future<AttendanceResponses, Error> { completion in
      print("[FETCH ATTENDANCE][\(id)]")
      
      let body: [String: Any] = [
        "pelajaran_id": id
      ]
      
      let jsonData = try? JSONSerialization.data(withJSONObject: body)
      
      // API GET ALL TASKS
      let components = URLComponents(string: Api.attendance)
      
      guard let urlString = components?.string else { return }
      guard let url = URL(string: urlString) else { return }
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.httpBody = jsonData
      
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
          print("[ERROR ATTENDANCE][\(id)][\(error.localizedDescription)]")
          completion(.failure(error))
          return
        }
        if let data = data {
          do {
            let result = try JSONDecoder().decode(AttendanceResponseContainer.self, from: data)
            completion(.success(result.result))
            print("[SUCCESS]")
          } catch {
            print("[ERROR ATTENDANCE][\(id)][\(error)]")
            completion(.failure(error))
          }
        } else {
          print("[ERROR ATTENDANCE]")
          completion(.failure(URLError.custom("Data can't be initialized")))
        }
      }
      task.resume()
    }
    .eraseToAnyPublisher()
  }
  
}
