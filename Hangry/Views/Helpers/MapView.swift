//
//  MapView.swift
//  Hangry
//
//  Created by Bryan Tacuri on 4/17/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
                
            }
            
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        MapView(coordinate: CLLocationCoordinate2D(latitude: 41.155_491_221_2146, longitude: -73.422_766_947_5907))
    }
}
