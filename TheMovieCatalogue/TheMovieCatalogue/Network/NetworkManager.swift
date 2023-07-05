//
//  NetworkManager.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

struct Decoder {
    let decoder = JSONDecoder()
    
    func decodingProcess(from data: Data) {
        do {
            let movie = try decoder.decode(Movie.self, from: data)
            print("Movie: \(movie)")
            
        } catch let error {
            print("Error: \(error)")
        }
    }

    func decodePopulars(from data: Data) throws -> PopularMovies {
        do {
            let popularMovies = try decoder.decode(PopularMovies.self, from: data)
            return popularMovies
        } catch let error {
            print("Decoding Populars error: \(error)")
            throw error
        }
    }
}


struct NetworkManager {
    let session = URLSession.shared
    let decoder = Decoder()
    
    func fetchMovie(from url: URL) {
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            decoder.decodingProcess(from: data)
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
                populars = try decoder.decodePopulars(from: data)
                completion(populars)
            } catch let error{
                print("Fetch popular error: \(error)")
            }
        }
        task.resume()
    }
}
