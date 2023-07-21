//
//  MovieListItem.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 05/07/23.
//

import Foundation

struct MovieListItem: Identifiable, Codable, Hashable {
    let id: Int
    let posterPath: String
    var posterSize: ImageSize = .width154
    var posterString: String {
        let endpointBuilder = EndpointBuilder()
        return endpointBuilder.getImageURLString(imageSize: posterSize, imagePath: posterPath) ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
    }
    static let mock = MovieListItem(id: 268, posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg")
    static let mock2 = MovieListItem(id: 129, posterPath: "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg")
    static let mock3 = MovieListItem(id: 112, posterPath: "/hOb6ODI7QQFKkOe3eJU2Fdh2fk1.jpg")
    static let mock4 = MovieListItem(id: 113, posterPath: "/NNxYkU70HPurnNCSiCjYAmacwm.jpg")
    static let mock5 = MovieListItem(id: 114, posterPath: "/8riWcADI1ekEiBguVB9vkilhiQm.jpg")
    static let mock6 = MovieListItem(id: 115, posterPath: "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg")
    static let mock7 = MovieListItem(id: 116, posterPath: "/nb9fc9INMg8kQ8L7sE7XTNsZnUX.jpg")

}
