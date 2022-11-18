//
//  QuoteDataController.swift
//  OmadaQuotes
//
//  Created by Matthew Rawlings on 11/15/22.
//

import Foundation

class QuoteDataController {
    
    /// singleton
    static let shared = QuoteDataController()
    
    /// static data
    var quoteData: [QuoteData] = []
    
    /// call load func upon initialization
    init() {
        loadData()
    }
    
    /// function that parses JSON into above array
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decodedData = try JSONDecoder().decode([QuoteData].self, from: data)
                quoteData = decodedData
                print("[QuoteDataController] loadData: quoteData loaded successfully with \(quoteData.count) items")
            } catch {
                print("[QuoteDataController] loadData: quoteData was unable to be loaded because: \(error.localizedDescription)")
            }
        }
    }
}
