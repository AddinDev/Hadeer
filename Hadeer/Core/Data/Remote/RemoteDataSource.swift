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
//  func signUp(_ email: String, _ fullname: String, _ username: String, _ password: String) -> AnyPublisher<Bool, Error>
//  func fetchTasks(_ username: String) -> AnyPublisher<Bool, Error>

}

final class RemoteDataSource {
  
  init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
//  func signIn(_ email: String, _ password: String) -> AnyPublisher<Bool, Error> {
//    return Future<Bool, Error> { completion in
//      guard let url = URL(string: Api.signIn) { else return }
//      AF.request(url)
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
//
//  func signUp(_ email: String, _ fullname: String, _ username: String, _ password: String) -> AnyPublisher<Bool, Error> {
//
//  }
//
//  func fetchTasks(_ username: String) -> AnyPublisher<Bool, Error> {
//
//  }
  
}
