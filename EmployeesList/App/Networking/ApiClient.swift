//
//  ApiClient.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import Foundation

enum RequestError {
    case errorParsing
}

extension RequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .errorParsing:
            return "Error parsing data"
        }
    }
}

protocol Requester {
    func request<T: Decodable>(type: T.Type, completion: @escaping (Result<T,Error>) -> Void)
}

class ApiClient: Requester {
    
    private let decoder: JSONDecoder = {
       let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func request<T: Decodable>(type: T.Type, completion: @escaping (Result<T,Error>) -> Void ) {
        
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let model = try self.decoder.decode(T.self, from: data)
                    completion(.success(model))
                }catch {
                    completion(Result.failure(RequestError.errorParsing))
                }
                
            } else if let error = error {
                completion(Result.failure(error))
            }
        }
        
        task.resume()
    }
}
