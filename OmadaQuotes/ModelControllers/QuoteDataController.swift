//
//  QuoteDataController.swift
//  OmadaQuotes
//
//  Created by Matthew Rawlings on 11/15/22.
//

import Foundation

class QuoteDataController {
    
    // singleton
    static let shared = QuoteDataController()
    
    // static data
    var quoteData: [QuoteData] = []
    
    // call load func upon initialization
    init() {
        loadData()
    }
    
    // get and decode json data to usable data
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decodedData = try JSONDecoder().decode([QuoteData].self, from: data)
                quoteData = decodedData
            } catch {
                print(error)
            }
        }
    }
}
