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

    func fetchData <T: Codable>(endpoint: URL?, type: T.Type,completion: @escaping(T?) -> Void) {
        if let endpoint = endpoint {
            var urlRequest = URLRequest(url: endpoint)
            urlRequest.allHTTPHeaderFields = headers
            fetch(with: urlRequest, type: T.self, completion: completion)
        }
    }
    private func fetch<T: Codable>(with urlRequest: URLRequest, type: T.Type, completion: @escaping (T?) -> Void ) {
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error:  \(String(describing: error))")
                return
            }
            do {
                let model = try decoder.decode(from: data, type: type.self)
                DispatchQueue.main.async {
                    completion(model)
                }
            } catch let error {
                print("NetworkManager: Fetching error: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
