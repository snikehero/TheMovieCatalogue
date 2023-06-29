//
//  NetworkManager.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

func decodingProcess(from data: Data) {
    let decoder = JSONDecoder()
    do {
        let movie = try decoder.decode(Movie.self, from: data)
        print("Movie: \(movie)")
        
    } catch let error {
        print("Error: \(error)")
    }
}

func decodePopulars(from data: Data) throws -> PopularMovies {
    let decoder = JSONDecoder()
    
    do {
        let popularMovies = try decoder.decode(PopularMovies.self, from: data)
        return popularMovies
    } catch let error {
        print("Decoding Populars error: \(error)")
        throw error
    }
}

struct NetworkManager {
    let session = URLSession.shared
    
    func fetchMovie(from url: URL) {
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            decodingProcess(from: data)
        }
        task.resume()
    }
    
    func fetchPopular(from url:URL) -> PopularMovies {
        let urlRequest = URLRequest(url: url)
        var populars = PopularMovies(page: nil, results: nil)
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            do {
                populars = try decodePopulars(from: data)
            } catch let error{
                print("Fetch popular error: \(error)")
            }
        }
        task.resume()
        return populars
    }
}
