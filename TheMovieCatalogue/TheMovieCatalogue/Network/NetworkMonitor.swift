//
//  NetworkMonitor.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 27/06/23.
//

import Foundation

func decodingProcess(from data: Data) {
    let decoder = JSONDecoder()

    do {
        let movie = try decoder.decode(Movie.self, from: data)
        print("Movie: \(movie)")
<<<<<<< HEAD
=======

//        if let imageUrl = URL(string: pokemon.sprites.frontDefault) {
//            getImage(from: imageUrl)
//        }

//        let movesEndpoint: PokemonEndpoint = .move(pokemon.id)
//        print(movesEndpoint.path)
>>>>>>> 64672f3 (Changed requests from Viewmodel file to NetworkMonitor file)
        
    } catch let error {
        print("Error: \(error)")
    }
}

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
