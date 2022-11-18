//
//  QuoteData.swift
//  OmadaQuotes
//
//  Created by Matthew Rawlings on 11/15/22.
//

import Foundation

/// creating struct to match json format
struct QuoteData: Codable {
    var quote: String
    var author: String
    var slideTransitionDelay: Int
    var image: String
}
