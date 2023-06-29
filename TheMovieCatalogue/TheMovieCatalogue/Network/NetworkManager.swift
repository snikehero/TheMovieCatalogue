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
    
}