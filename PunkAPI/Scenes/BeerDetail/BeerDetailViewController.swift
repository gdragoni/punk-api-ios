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
        abvLbl.text = beer.abvString
        ibuLbl.text = beer.ibuString
        descriptionLbl.text = beer.beerDescription
        
        if let urlString = beer.imageURL,
           let url = URL(string: urlString) {
            imageView.af.setImage(withURL: url)
        }
    }
}
