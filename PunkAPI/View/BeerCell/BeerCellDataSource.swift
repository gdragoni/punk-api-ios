//
//  BeerCellDataSource.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import Foundation
import UIKit

class BeerCellDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    var countItems: Int {
        return items.count
    }
    func item(for indexPath: IndexPath) -> T {
        return items[indexPath.row]
    }
    
    init(cellIdentifier : String, configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  []
        self.configureCell = configureCell
    }
    
    func add(items: [T]) {
        self.items+=items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
