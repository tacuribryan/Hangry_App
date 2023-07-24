//
//  Filters.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/25/23.
//

import Foundation

struct Filters {
    var radius =  16093 //meters
    var sortBy = SortOption.rating
    var openNow = true
    
    static let `default` = Filters(radius: 10)
    
    enum SortOption: String, CaseIterable, Identifiable {
        case rating = "Rating"
        case bestMatch = "Best Match"
        case reviewCount = "Review Count"
        case distance = "Distance"
        
        var id: String {rawValue}
    }
}
