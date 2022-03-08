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
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error>
  func signIn(_ username: String, _ password: String) -> AnyPublisher<DefaultResponse, Error>
  //  func fetchTasks(_ username: String) -> AnyPublisher<Bool, Error>
  
}

final class RemoteDataSource {
  
  init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func signUp(_ email: String, _ username: String, _ phone: String, _ password: String) -> AnyPublisher<DefaultResponse, Error> {
    print("TASK REGISTER")
    return Future<DefaultResponse, Error> { completion in
      guard let url = URL(string: Api.signUp) else { return }
      let auth = SignUpAuthorizationModel(serverkey: Api.serverKey,
                                          username: username,
                                          password: password,
                                          email: email,
                                          phone: phone).encryptAndEncode()
      AF.request(url, method: .post, headers: [.authorization(auth)])
        .validate()
        .responseDecodable(of: DefaultResponse.self) { response in
          switch response.result {
            case .success(let value):
              switch value.status_code {
                case 200:
                  completion(.success(value))
                default:
                  print("TASKERROR HTTP STATUS: \(value.status)")
                  completion(.failure(URLError.custom(value.message ?? "null")))
              }
            case .failure(let error):
              print("TASKERROR: \(error.localizedDescription)")
              completion(.failure(error))
          }
        }
    }
    .eraseToAnyPublisher()
  }
  
  func signIn(_ username: String, _ password: String) -> AnyPublisher<DefaultResponse, Error> {
    return Future<DefaultResponse, Error> { completion in
      guard let url = URL(string: Api.signIn) else { return }
      let auth = SignInAuthorizationModel(serverkey: Api.serverKey,
                                          username: username,
                                          password: password).encryptAndEncode()
      AF.request(url, method: .post, headers: [.authorization(auth)])
        .validate()
        .responseDecodable(of: DefaultResponse.self) { response in
          switch response.result {
            case .success(let value):
              switch value.status_code {
                case 200:
                  completion(.success(value))
                default:
                  print("TASKERROR HTTP STATUS: \(value.status)")
                  completion(.failure(URLError.custom(value.message ?? "null")))
              }
            case .failure(let error):
              print("TASKERROR: \(error.localizedDescription)")
              completion(.failure(error))
          }
        }
    }
    .eraseToAnyPublisher()
    
  }
  
}
