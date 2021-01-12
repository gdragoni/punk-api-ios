//
//  BeerListViewModel.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import Foundation

class BeerListViewModel {
    var viewController: BeerListViewController!
    var currentPage: Int = 1
    var perPage: Int = 20
    var isFetching: Bool = false
    
    let debouncer = Debouncer(timeInterval: 1)
    
    init(viewController: BeerListViewController) {
        self.viewController = viewController
    }
    
    func loadBeers() {
        guard !isFetching else { return }
        isFetching = true
        Network.run(service: .beers(currentPage, perPage)).responseDecodable(of: [Beer].self) { [weak self] completion in
            switch completion.result {
            case .success(let beers):
                self?.perPage+=1
                self?.viewController.incrementDataSource(items: beers)
            case .failure(let error):
                self?.viewController.showAlert(msg: error.localizedDescription)
            }
            self?.isFetching = false
        }
    }
    
    func loadMoreBeers() {
        debouncer.renewInterval()
        debouncer.handler = { [weak self] in
            self?.loadBeers()
        }
    }
}
