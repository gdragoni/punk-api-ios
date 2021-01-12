//
//  Network.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import Foundation
import Alamofire

class Network {
    
    static func run(service: APIService, method: HTTPMethod = .get, parameters: [String:Any] = [:]) -> DataRequest {
        let url = API.fullPath(for: service)
        
        return AF.request(url, method: method, parameters: parameters)
    }
    
    static var isConnectedToInternet: Bool {
        if let networkManager = NetworkReachabilityManager() {
            return networkManager.isReachable
        }
        return false
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
