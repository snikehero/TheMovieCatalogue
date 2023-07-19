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
    private let endpointBuilder = EndpointBuilder()
    var posterString: String {
        return endpointBuilder.getImageURLString(imageSize: .width500, imagePath: posterPath) ?? ""
    }
    var backdropString: String {
        return endpointBuilder.getImageURLString(imageSize: .width500, imagePath: posterPath) ?? ""
    }
    var genres: [Genre]
    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case runtime
        case releaseDate = "release_date"
        case genres
    }
    static let mock = Movie(id: 268,
                            title: "Batman",
                            overview: """
Batman must face his most ruthless nemesis when a deformed madman calling
himself \"The Joker\" seizes control of Gotham's criminal underworld.
""",
                            posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg",
                            backdropPath: "/frDS8A5vIP927KYAxTVVKRIbqZw.jpg" ,
                            runtime: 126,
                            releaseDate: "1989-06-23",
                            genres: [Genre.mock]
    )
}

extension Movie {
    // Conform to Equatable protocol for testing
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return (
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.overview == rhs.overview &&
            lhs.posterString == rhs.posterString &&
            lhs.backdropString == rhs.backdropString &&
            lhs.runtime == rhs.runtime &&
            lhs.releaseDate == rhs.releaseDate
        )
    }
}
