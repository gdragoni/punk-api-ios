//
//  Enviroment.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import Foundation

class Enviroment {
    
    static private var enviroments: NSDictionary {
        let enviromentsDict = NSDictionary(dictionary: Bundle.main.infoDictionary!).value(forKey: "Enviroment") as! NSDictionary
        return enviromentsDict
    }
    
    static func value(for option: EnvOptions) -> String {
        return enviroments.value(forKey: option.rawValue) as! String
    }
    
    enum EnvOptions: String {
        case apiBaseURL = "API_BASE_URL"
    }
}
