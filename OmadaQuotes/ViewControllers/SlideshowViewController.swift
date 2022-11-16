//
//  SlideshowViewController.swift
//  OmadaQuotes
//
//  Created by Matthew Rawlings on 11/15/22.
//

import UIKit

class SlideshowViewController: UIViewController {

    //MARK: - PROPERTIES
    
    
    //MARK: - OUTLETS
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    //MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        authorLabel.text = QuoteDataController.shared.quoteData[0].author
        quoteLabel.text = QuoteDataController.shared.quoteData[0].quote
    }
    
    //MARK: - HELPER METHODS



}
