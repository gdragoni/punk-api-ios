//
//  API.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import Foundation

class API {
    static private let baseURL: String = Enviroment.value(for: .apiBaseURL)
    
    static public func fullPath(for service: APIService) -> String { return "\(baseURL)\(service.path)" }
}

enum APIService {
    case beers(Int, Int)
}

protocol Path {
    var path: String { get }
}

extension APIService : Path {
    var path: String {
        switch self {
        case .beers(let page, let perPage): return "beers?page=\(page)&per_page=\(perPage)"
        }
    }
}
