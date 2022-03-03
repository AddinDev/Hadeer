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
  //  func signIn(_ email: String, _ password: String) -> AnyPublisher<Bool, Error>
  func signUp(_ username: String, _ email: String, _ phone: String, _ password: String) -> AnyPublisher<Bool, Error>
  //  func fetchTasks(_ username: String) -> AnyPublisher<Bool, Error>
  
}

final class RemoteDataSource {
  
  init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func signUp(_ email: String, _ username: String, _ phone: String, _ password: String) -> AnyPublisher<Bool, Error> {
    print("TASK REGISTER")
    return Future<Bool, Error> { completion in
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
                  completion(.success(true))
                default:
                  completion(.success(false))
              }
            case .failure(let error):
              print(error.localizedDescription)
              completion(.failure(error))
          }
        }
    }
    .eraseToAnyPublisher()
  }
  
  //  func signIn(_ email: String, _ password: String) -> AnyPublisher<Bool, Error> {
  //    return Future<Bool, Error> { completion in
  //      guard let url = URL(string: Api.signIn) { else return }
  //      AF.request(Api.signUp, method: .post, headers: [.authorization("")])
  //        .validate()
  //        .responseDecodable(of: ) { response in
  //          switch response.result {
  //            case .success(let value):
  //              completion(.success(value))
  //            case .failure(let error):
  //              completion(.failure(error))
  //          }
  //        }
  //    }
  //    .eraseToAnyPublisher()
  //
  //  }
  
  
}
