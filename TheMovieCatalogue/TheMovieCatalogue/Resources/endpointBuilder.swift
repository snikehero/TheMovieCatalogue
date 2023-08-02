//
//  endpointBuilder.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 17/07/23.
//

import Foundation

enum ImageSize: String {
    case width154 = "w154"
    case width500 = "w500"
    case original = "original"
}

class EndpointBuilder {
    private var components = URLComponents()
    private let apiKey = "aded2171cae8dca24a5d19455224f699"
    init(components: URLComponents = URLComponents()) {
        self.components = components
        self.components.scheme = "https"
        self.components.host = "api.themoviedb.org"
        self.components.path = EndpointBuilder.moviePath
    }
    func getMovieURL(id: Int) -> URL? {
        components.path = EndpointBuilder.moviePath + "/" + String(id)
        return self.components.url
    }
    func getPopularURL(page: Int) -> URL? {
        components.path = EndpointBuilder.moviePath + "/popular"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        return components.url
    }
    func getNowPlayingURL(page: Int) -> URL? {
        components.path = EndpointBuilder.moviePath + "/now_playing"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        return components.url
    }
    func getImageURLString(imageSize: ImageSize, imagePath: String) -> String? {
        components.host = "image.tmdb.org"
        components.path = "/t/p/\(imageSize.rawValue + imagePath)"
        return components.string
    }
    func getTopRatedURL(page: Int) -> URL? {
        components.path = EndpointBuilder.moviePath + "/top_rated"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        return components.url
    }
    func getMovieListBySearch(searchText: String) -> URL? {
        components.path = EndpointBuilder.searchMoviePath
        components.queryItems = [
            URLQueryItem(name: "query", value: searchText)
        ]
        return components.url
    }
    func getGenresURL() -> URL? {
        components.path = EndpointBuilder.genresPath + EndpointBuilder.movieListPath
        return components.url
    }
}

extension EndpointBuilder {
    static let moviePath: String = "/3/movie"
    static let genresPath: String = "/3/genre"
    static let movieListPath: String = "/movie/list"
    static let searchMoviePath: String = "/3/search/movie"
}
