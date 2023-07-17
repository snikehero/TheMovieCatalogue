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

struct EndpointBuilder {
    private var components = URLComponents()
    private let api_key = "aded2171cae8dca24a5d19455224f699"
    
    init(components: URLComponents = URLComponents()) {
        self.components = components
        self.components.scheme = "https"
        self.components.host = "api.themoviedb.org"
        self.components.path = "/3/movie/"
    }
    
    mutating func movie(id: Int) -> URL?{
        self.components.path = "/3/movie/\(id)"
        self.components.queryItems = [
            URLQueryItem(name: "api_key", value: self.api_key)
        ]
        return self.components.url
    }
    
    mutating func popular(page: Int) -> URL?{
        self.components.path = "/3/movie/popular"
        self.components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: self.api_key)
        ]
        return self.components.url
    }
    
    mutating func nowPlaying(page: Int) -> URL?{
        self.components.path = "/3/movie/now_playing"
        self.components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: self.api_key)
        ]
        return self.components.url
    }
    
    mutating func image(imageSize: String, imagePath: String) -> String?{
        self.components.host = "image.tmdb.org"
        self.components.path = "/t/p/\(imageSize + imagePath)"
        
        return self.components.string
    }
    
    mutating func topRated(page: Int) -> URL?{
        self.components.path = "/3/movie/top_rated"
        self.components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: self.api_key)
        ]
        return self.components.url
    }
    
}
