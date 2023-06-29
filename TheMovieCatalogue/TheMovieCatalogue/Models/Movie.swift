//
//  Movie.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 20/06/23.
//

import Foundation

struct Movie: Identifiable, Codable, Equatable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let runtime: Int
    let releaseDate: String
    var poster: String {
        "https://image.tmdb.org/t/p/original\(posterPath)"
    }
    var backdrop: String {
        "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
    var genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case runtime = "runtime"
        case releaseDate = "release_date"
        case genres = "genres"
    }
    
    static let mock = Movie(id: 268,
                            title: "Batman",
                            overview: "Batman must face his most ruthless nemesis when a deformed madman calling himself \"The Joker\" seizes control of Gotham's criminal underworld.",
                            posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg",
                            backdropPath: "/frDS8A5vIP927KYAxTVVKRIbqZw.jpg" ,
                            runtime: 126,
                            releaseDate: "1989-06-23",
                            genres: [Genre.mock]
    )
}

extension Movie {
    //Conform to Equatable protocol for testing
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return (
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.overview == rhs.overview &&
            lhs.poster == rhs.poster &&
            lhs.backdrop == rhs.backdrop &&
            lhs.runtime == rhs.runtime &&
            lhs.releaseDate == rhs.releaseDate
        )
    }
}
