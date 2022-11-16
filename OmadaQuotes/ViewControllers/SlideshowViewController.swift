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
        super.viewDidLoad()

        present()
    }
    
    //MARK: - HELPER METHODS

    func present() {
        slideViews()
        self.view.layoutIfNeeded()
        let waitTime = Double(QuoteDataController.shared.quoteData[characterIndex].slideTransitionDelay)/1000
        authorLabel.text = QuoteDataController.shared.quoteData[characterIndex].author
        quoteLabel.text = "\"\(QuoteDataController.shared.quoteData[characterIndex].quote)\""
        image.image = UIImage(named: "\(characterIndex)")
        
            DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                // after time above, execute this block of code
                if self.characterIndex == QuoteDataController.shared.quoteData.count-1 {
                    self.characterIndex = 0
                } else {
                    self.characterIndex += 1
                }
                self.view.layoutIfNeeded()
                self.present()
        }
    }
    
    func slideViews() {
        authorLabel.center.x = view.center.x // Place it in the center x of the view.
        authorLabel.center.x += view.bounds.width // Place it on the left of the view with the width = the bounds'width of the view.
            // animate it from the left to the right
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.authorLabel.center.x -= self.view.bounds.width
                  self.view.layoutIfNeeded()
            }, completion: nil)
        
        quoteLabel.center.x = view.center.x // Place it in the center x of the view.
        quoteLabel.center.x += view.bounds.width // Place it on the left of the view with the width = the bounds'width of the view.
            // animate it from the left to the right
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.quoteLabel.center.x -= self.view.bounds.width
                  self.view.layoutIfNeeded()
            }, completion: nil)
        
        image.center.x = view.center.x // Place it in the center x of the view.
        image.center.x += view.bounds.width // Place it on the left of the view with the width = the bounds'width of the view.
            // animate it from the left to the right
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.image.center.x -= self.view.bounds.width
                  self.view.layoutIfNeeded()
            }, completion: nil)
    }

}
