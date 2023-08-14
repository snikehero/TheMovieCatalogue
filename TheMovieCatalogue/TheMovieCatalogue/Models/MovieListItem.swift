//
//  MovieListItem.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 05/07/23.
//

import Foundation

struct MovieListItem: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let posterPath: String?
    var posterSize: ImageSize = .width154
    var posterString: String {
        let endpointBuilder = EndpointBuilder()
        return endpointBuilder.getImageURLString(imageSize: posterSize, imagePath: posterPath ?? "") ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case posterPath = "poster_path"
    }
}
