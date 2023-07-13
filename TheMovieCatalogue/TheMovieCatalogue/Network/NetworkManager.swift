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
    
    private var request: (MovieEndpoint) -> URLRequest = { endpoint in
        let endpointUrl = endpoint.url
        return URLRequest(url: endpointUrl)
    }
    
    func fetchMovie(withId id: Int, completion: @escaping (Movie?) -> Void ) {
        let urlRequest = request(.movie(id))
        fetch(with: urlRequest, type: Movie.self, completion: completion)
    }
    
    func fetchPage(endpoint: MovieEndpoint, completion: @escaping(MovieListPage?) -> Void){
        let urlRequest = request(endpoint)
        fetch(with: urlRequest, type: MovieListPage.self, completion: completion)
    }
    
    private func fetch<T: Codable>(with urlRequest: URLRequest, type: T.Type, completion: @escaping (T?) -> Void ) {
        let task = session.dataTask(with: urlRequest){ data, _, error in
            guard let data = data else {
                print("Error:  \(String(describing: error))")
                return
            }
            do {
                let model = try decoder.decode(from: data, type: type.self)
                completion(model)
            } catch let error {
                print("NetworkManager: Fetching error: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
