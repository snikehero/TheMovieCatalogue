//
//  PopularMovies.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

struct MovieListPage: Codable {
    var page: Int
    var results: [MovieListItem]
    var totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}
