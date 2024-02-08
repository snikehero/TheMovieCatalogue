//
//  CastMember.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 20/06/23.
//

import Foundation

struct Credits: Codable, Identifiable {
    let id: Int
    var cast: [CastMember]
    static var mock = Credits(id: 268, cast: [CastMember.mock, CastMember.mock, CastMember.mock])
}

struct CastMember: Codable, Identifiable {
    let id: Int
    let name: String
    static var mock = CastMember(id: 2232, name: "Michael Keaton")
}
