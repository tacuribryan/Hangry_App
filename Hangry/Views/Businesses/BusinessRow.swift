//
//  BusinessRow.swift
//  Hangry
//
//  Created by Bryan Tacuri on 4/17/23.
//

import SwiftUI
import CoreLocation

struct BusinessRow: View {
    @StateObject private var viewModel = ContentViewModel()
    var business: Business
    
    var body: some View {
        
        let businessCordinate = CLLocationCoordinate2D(latitude: business.locationCoordinate.latitude, longitude: business.locationCoordinate.longitude)
        HStack {
            AsyncImage(url: URL(string: business.imageURL)) { image in
                image
                    .resizable()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }

            let bussinessAddress = "\(business.location.address1) \(business.location.city) \(business.location.state) ".uppercased()
            
            //Converting distance to miles from start destination to business.
            let distanceInMiles = (Double(business.distance) / 1609.34)
            let roundedDistance = (distanceInMiles * 10).rounded(.up) / 10 //round to one decimal point
            
                VStack(alignment: .leading) {
                    Text(business.name)
                        .font(.title2)
                    Group {
                        Text("⭐️ ") +
                        Text(business.rating.description)
                            .foregroundColor(.yellow) +
                        Text(" (\(business.reviewCount.description)) • \(business.price ?? "$?") • \(business.categories.first?.title ?? "")")
                        
                        Text(String(format: "%.1f", roundedDistance) + " mi • \(business.location.city) \(business.location.state)")
                        
                        if !business.transactions.isEmpty {
                            Text(business.transactions.map { $0.rawValue }.joined(separator: " • "))
                        }
                    }
                    .font(.caption)
                }
                Spacer()
        }
        
    }
}

struct BusinessRow_Previews: PreviewProvider {
    static let network = Network()

    static var previews: some View {
        Text("Test \(network.businesses.count)")
    }
}
