//
//  Decoder.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 30/06/23.
//

import Foundation

struct Decoder {
    private let decoder = JSONDecoder()
    
    func decode<T: Codable>(from data: Data) throws -> T{
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch let error {
            print("Decoder: Decoding error: \(error)")
            throw error
        }
    }
}
