//
//  UIViewController+EnumSegueProtocol.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 12/01/21.
//

import UIKit

extension UIViewController {
    
    func performSegue(withIdentifier enumSegue: EnumSegueProtocol, sender: Any?) {
        performSegue(withIdentifier: enumSegue.rawValue, sender: sender)
    }
}
