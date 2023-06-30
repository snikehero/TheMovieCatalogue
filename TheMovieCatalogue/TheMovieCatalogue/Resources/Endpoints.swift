//
//  File.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 26/06/23.
//

import Foundation

// https://api.themoviedb.org/3/movie/157336?api_key=aded2171cae8dca24a5d19455224f699
//https://api.themoviedb.org/3/movie/popular?page=1&api_key=aded2171cae8dca24a5d19455224f699

public enum MovieEndpoint {
    case movie(Int)
    case page(Int)
    
    private var scheme: String{
        return "https://"
    }
    
    private var host: String{
        return "api.themoviedb.org/3/movie/"
    }
    
    private var key: String{
        return "aded2171cae8dca24a5d19455224f699"
    }
    
    public var path: String{
        switch self{
        case let .movie(value):
            return scheme + host + "\(value)" + "?api_key=" + key
        case let .page(value):
            return scheme + host + "popular?" + "page=\(value)" + "&api_key=" + key

        }
    }
    
    public var url: URL {
        return URL(string: path)!
    }
    
}
