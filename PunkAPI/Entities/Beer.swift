//
//  Beer.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import Foundation
import Alamofire

struct Beer: Codable {
    let id: Int?
    let name, tagline, beerDescription, imageURL: String?
    let abv, ibu: Double?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case beerDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
    }
    
    var abvString: String { String(format: "Teor alcoólico %.1f%% vol.", abv ?? 0) }
    var ibuString: String { String(format: "Escala de amargor %.1f", ibu ?? 0) }
}
