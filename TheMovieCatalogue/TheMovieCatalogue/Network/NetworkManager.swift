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
    
    func fetchMovie(completion: @escaping (Movie?) -> ()){
        let movieId = 157336
        let endpoint: MovieEndpoint = .movie(movieId)
        let url = endpoint.url
        let urlRequest = URLRequest(url: url)
        var movie: Movie?
        
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            do {
                movie = try decoder.decode(from: data)
                completion(movie)
            } catch let error{
                print("NetworkManager: Fetch movie error: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchPopular(from url:URL, completion: @escaping(PopularMovies?) -> ()) {
        let urlRequest = URLRequest(url: url)
        var populars : PopularMovies?
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            do {
                populars = try decoder.decode(from: data)
                completion(populars)
            } catch let error{
                print("Fetch popular error: \(error)")
            }
        }
        task.resume()
    }
}
