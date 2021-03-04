//
//  APIService.swift
//  weather-app-ios
//
//  Created by Rick Brown on 04/03/2021.
//

import Foundation

class APIService {
  static let shared = APIService()
  
  enum APIError: Error {
    case error(_ errorString: String)
  }
  
  func getJSON<T: Codable>(
    urlString: String,
    dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
    keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
    completion: @escaping (Result<T, APIError>) -> Void
  ) {
    guard let url = URL(string: urlString) else {
      completion(.failure(.error(NSLocalizedString("Error: Invalid URL!!", comment: ""))))
      return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completion(.failure(.error(NSLocalizedString("Error: \(error.localizedDescription)", comment: ""))))
        return
      }
      
      guard let data = data else {
        completion(.failure(.error(NSLocalizedString("Error: Data is corrupt", comment: ""))))
        return
      }
      
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = dateDecodingStrategy
      decoder.keyDecodingStrategy = keyDecodingStrategy
      
      do {
        let decodedData = try decoder.decode(T.self, from: data)
        completion(.success(decodedData))
        return
      } catch let decodingError {
        completion(.failure(APIError.error("Error: \(decodingError.localizedDescription)")))
      }
      
    }.resume()
    
    
  }
}
