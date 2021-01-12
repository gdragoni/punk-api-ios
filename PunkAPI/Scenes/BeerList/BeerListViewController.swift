//
//  BeerListViewController.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 11/01/21.
//

import UIKit
import AlamofireImage

class BeerListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private var dataSource: BeerCellDataSource<BeerTableViewCell,Beer>!
    lazy var viewModel = BeerListViewModel(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        viewModel.loadBeers()
    }
    
    func setupTableView() {
        let cellIdentifier = "BeerTableViewCell"
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.dataSource = BeerCellDataSource(cellIdentifier: cellIdentifier, configureCell: { cell, beer in
            cell.titleLbl.text = beer.name
            cell.abvLbl.text = String(format: "Teor alcoólico %.1f%% vol.", beer.abv ?? 0)
            if let imgURLString = beer.imageURL,
            let url = URL(string: imgURLString) {
                cell.imgView.af.setImage(withURL: url, cacheKey: beer.imageURL ?? "", imageTransition: .crossDissolve(1), runImageTransitionIfCached: false)
            } else {
                cell.imgView = nil
            }
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.dataSource = self?.dataSource
            self?.tableView.delegate = self
            self?.tableView.reloadData()
        }
    }
    
    func incrementDataSource(items: [Beer]) {
        dataSource.add(items: items)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Atenção", message: msg, preferredStyle: .alert)
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension BeerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        guard indexPath.row < dataSource.countItems else { return }
        print(dataSource.item(for: indexPath))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.countItems-1 {
            viewModel.loadMoreBeers()
        }
    }
}
