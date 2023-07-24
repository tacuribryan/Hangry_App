//
//  SearchFilters.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/24/23.
//

import SwiftUI

struct SearchFilters: View {
//    var filters = Filters
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        List {
            Text("Search Filters")
            
            
            /**
             var sortBy = SortOption.rating
             var openNow = true
             var radius =  16093 //meters
             */
        }
    }
}

struct SearchFilters_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilters()
    }
}
