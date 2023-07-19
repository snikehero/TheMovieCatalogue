//
//  NowPlaying.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 07/07/23.
//

import Foundation

struct NowPlaying: Codable {
    var page: Int
    var results: [MovieListItem]
}
