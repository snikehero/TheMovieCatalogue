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
}

class EndpointBuilder {
    private var components = URLComponents()
    private let api_key = "aded2171cae8dca24a5d19455224f699"
    
    init(components: URLComponents = URLComponents()) {
        self.components = components
        self.components.scheme = "https"
        self.components.host = "api.themoviedb.org"
        self.components.path = "/3/movie/"
    }
    
    func getMovieURL(id: Int) -> URL?{
        components.path = "/3/movie/\(id)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: api_key)
        ]
        return self.components.url
    }
    
    func getPopularURL(page: Int) -> URL?{
        components.path = "/3/movie/popular"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: api_key)
        ]
        return components.url
    }
    
    func getNowPlayingURL(page: Int) -> URL?{
        components.path = "/3/movie/now_playing"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: api_key)
        ]
        return components.url
    }
    
    func getImageURLString(imageSize: String, imagePath: String) -> String?{
        components.host = "image.tmdb.org"
        components.path = "/t/p/\(imageSize + imagePath)"
        
        return components.string
    }
    
    func getTopRatedURL(page: Int) -> URL?{
        components.path = "/3/movie/top_rated"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: api_key)
        ]
        return components.url
    }
}
