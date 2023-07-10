//
//  File.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 26/06/23.
//

import Foundation

public enum MovieEndpoint {
    case movie(Int)
    case popular(Int)
    case image(String, String)
    
    private var scheme: String {
        return "https://"
    }
    
    private var host: String{
        return "api.themoviedb.org/3/movie/"
    }
    
    private var key: String{
        return "aded2171cae8dca24a5d19455224f699"
    }
    
    private var imageHost: String {
        "image.tmdb.org/t/p/"
    }
    
    public var path: String {
        switch self {
        case let .movie(value):
            return scheme + host + "\(value)" + "?api_key=" + key
        case let .popular(value):
            return scheme + host + "popular?" + "page=\(value)" + "&api_key=" + key
        case let .image(posterPath, imageSize):
            return scheme + imageHost + imageSize + posterPath
        }
    }
    
    public var url: URL {
        return URL(string: path)!
    }
}
