//
//  BeerDetailViewController.swift
//  PunkAPI
//
//  Created by Gabriel Dragoni on 12/01/21.
//

import UIKit
import AlamofireImage

class BeerDetailViewController: UIViewController {
    var beer: Beer?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var taglineLbl: UILabel!
    @IBOutlet var abvLbl: UILabel!
    @IBOutlet var ibuLbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        guard let beer = self.beer else { return }
        title = beer.name
        taglineLbl.text = beer.tagline
        abvLbl.text = String(format: "Teor alcoólico %.1f%% vol.", beer.abv ?? 0)
        ibuLbl.text = String(format: "Escala de amargor %.1f", beer.ibu ?? 0)
        descriptionLbl.text = beer.beerDescription
        
        if let urlString = beer.imageURL,
           let url = URL(string: urlString) {
            imageView.af.setImage(withURL: url)
        }
    }
}
