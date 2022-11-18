//
//  SlideshowViewController.swift
//  OmadaQuotes
//
//  Created by Matthew Rawlings on 11/15/22.
//


import UIKit

class SlideshowViewController: UIViewController {

    //MARK: - PROPERTIES
    var characterIndex = 0
    
    //MARK: - OUTLETS
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    //MARK: - LIFECYCLES
    override func viewDidLoad() {
        presentData()
    }
    
    //MARK: - HELPER METHODS
    func presentData() {
        /// set views to the right of screen width
        view.center.x += view.bounds.width
        
        /// set wait time in seconds
        let waitTime = Double(QuoteDataController.shared.quoteData[characterIndex].slideTransitionDelay)/1000
        
        /// populate outlets
        authorLabel.text = QuoteDataController.shared.quoteData[characterIndex].author
        quoteLabel.text = "\"\(QuoteDataController.shared.quoteData[characterIndex].quote)\""
        image.image = UIImage(named: "\(characterIndex)")
        
        /// call function to slide author, picture, and quote in
        slideViewsIn()
        
        /// delay for given wait time
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
            /// after time above, execute this block of code
            if self.characterIndex == QuoteDataController.shared.quoteData.count-1 {
                self.characterIndex = 0
            } else {
                self.characterIndex += 1
            }
            self.presentData()
        }
    }
    
    /// function that animates outlet data using the curveEaseOut animation
    func slideViewsIn() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.view.center.x -= self.view.bounds.width
                        }, completion: nil)
    }
}
