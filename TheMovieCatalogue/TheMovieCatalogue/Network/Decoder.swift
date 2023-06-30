//
//  Decoder.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 30/06/23.
//

import Foundation

struct Decoder {
    let decoder = JSONDecoder()
    
    func decodeMovie(from data: Data) throws -> Movie {
        do {
            let movie = try decoder.decode(Movie.self, from: data)
            return movie
        } catch let error {
            print("Decoding Movie error: \(error)")
            throw error
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
