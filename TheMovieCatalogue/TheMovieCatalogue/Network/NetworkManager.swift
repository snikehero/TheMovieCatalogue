//
//  NetworkManager.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

struct NetworkManager {
    private let session = URLSession.shared
    private let decoder = Decoder()
    private static let authorizationBearer = "Bearer eyJhbGciOiJIUzI1NiJ9." +
    "eyJhdWQiOiI3MzQ2YzJjNzIwMWRjMWI5YWUwZDE4N2IyZTNiYWI0NiIsInN1YiI6IjY0" +
    "ODlmYjhkZTM3NWMwMDBlMjUxY2VjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZX" +
    "JzaW9uIjoxfQ.GZukafCVw0_nLQBE6kBy7FEmTICzLGacuVOYzqtZYzQ"
    private static let headerAccept = "application/json"
    var headers = [
        "accept": NetworkManager.headerAccept,
      "Authorization": NetworkManager.authorizationBearer
    ]

    enum NetworkError: Error {
        case notFound
        case badRequest
        case serverError
        case unknown
    }

    func fetchData<T: Codable>(endpoint: URL?, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if let endpoint = endpoint {
            var urlRequest = URLRequest(url: endpoint)
            urlRequest.allHTTPHeaderFields = headers
            fetch(with: urlRequest, type: T.self, completion: completion)
        }
    }

    private func fetch<T: Codable>(with urlRequest: URLRequest, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void ) {
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }

            switch httpResponse.statusCode {
            case 200...299:
                guard let data = data else {
                    completion(.failure(.unknown))
                    return
                }
                do {
                    let model = try decoder.decode(from: data, type: type.self)
                    completion(.success(model))
                } catch let error {
                    print("NetworkManager: Decoding error: \(error)")
                    completion(.failure(.unknown))
                }

            case 400:
                completion(.failure(.badRequest))
            case 404:
                completion(.failure(.notFound))
            case 500...599:
                completion(.failure(.serverError))
            default:
                completion(.failure(.unknown))
            }
        }
        task.resume()
    }
}
