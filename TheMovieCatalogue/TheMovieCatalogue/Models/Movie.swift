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
    let poster_path: String
    let backdrop_path: String
    let runtime: Int
    let release_date: String
    var poster: String {
        "https://image.tmdb.org/t/p/original\(poster_path)"
    }
    var backdrop: String {
        "https://image.tmdb.org/t/p/original\(backdrop_path)"
    }
    
    var credits: Credits
    var genres: [Genre]
    
    static let mock = Movie(id: 268,
                            title: "Batman",
                            overview: "Batman must face his most ruthless nemesis when a deformed madman calling himself \"The Joker\" seizes control of Gotham's criminal underworld.",
                            poster_path: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg",
                            backdrop_path: "/frDS8A5vIP927KYAxTVVKRIbqZw.jpg" ,
                            runtime: 126,
                            release_date: "1989-06-23",
                            credits: Credits.mock,
                            genres: [Genre.mock]
    )
    
    // Conform to Equatable protocol for testing
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return (
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.overview == rhs.overview &&
            lhs.poster == rhs.poster &&
            lhs.backdrop == rhs.backdrop &&
            lhs.runtime == rhs.runtime &&
            lhs.release_date == rhs.release_date
        )
    }
}

