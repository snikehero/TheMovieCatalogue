//
//  PopularMovies.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

struct PopularMovies: Codable{
    var page: Int?
    var results: [Movie]?
}
