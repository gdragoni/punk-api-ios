//
//  SegueFrom.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 12/01/21.
//

import Foundation

class SegueFrom {
    
    enum beerList: String, EnumSegueProtocol {
        case toDetail = "toDetail"
    }
}

protocol EnumSegueProtocol {
    var rawValue: String { get }
}
