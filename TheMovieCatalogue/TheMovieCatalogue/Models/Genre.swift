//
//  Genre.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 20/06/23.
//

import Foundation

struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
    
    static var mock = Genre(id: 28, name: "Action")
}
