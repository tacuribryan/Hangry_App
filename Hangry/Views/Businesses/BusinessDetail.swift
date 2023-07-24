//
//  BusinessDetail.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/27/23.
//

import SwiftUI
import LoremSwiftum

struct BusinessDetail: View {
    @EnvironmentObject var network: Network
    var business: Business
    
    
    var businessIndex: Int {
        network.businesses.firstIndex(where: { $0.id == business.id})!
    }
    
//    func openMap(Address:String) {
//        UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(Address)")! as URL)
//    }

    var body: some View {
        ScrollView {
//            Text("Latitude: \(business.locationCoordinate.latitude) \n Longitude:\(business.locationCoordinate.longitude) 📍 ")
            
            
            MapView(coordinate: business.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
             
            AsyncImage(url: URL(string: business.imageURL)) { image in
    
                    CircleImage(image: image)
                        .offset(y: -120)
                        .padding(.bottom, -130)
                    //.scaledToFit()
                    //.aspectRatio(contentMode: .fit)
                
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(business.name)
                        .font(.title)

                }
                HStack {
                    let businessAddress = "\(business.location.address1) \(business.location.city) \(business.location.state) \(business.location.zipCode)".uppercased()
//                    Text(businessAddress)
                    Button(action:{
//                        openMap(Address: businessAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
                        OpenAppleMaps().openMap(Address: businessAddress)
                    }){
//                        Text(businessAddress)
                        Label(businessAddress, systemImage: "mappin.and.ellipse")
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
//                Text("Phone: \(business.displayPhone)")
                Link(destination: URL(string: "tel:\(business.phone)")!) {
//                    Text(business.displayPhone)
                    Label(business.displayPhone, systemImage: "phone.arrow.up.right")
                        .foregroundColor(.blue)
                }
                Link(destination: URL(string: business.url)!) {
                    Label("Open in Yelp", systemImage: "link")
                }
                
                Text("\nAbout \(business.name)")
//                    .font(.title2)
//                Text("Latitude: \(business.locationCoordinate.latitude) \n Longitude:\(business.locationCoordinate.longitude) 📍 ")
                Text(Lorem.paragraphs(2))

            }
            .padding()
            
        }
        //.navigationTitle("Test \(business.name)")
        //.navigationBarTitleDisplayMode(.inline)
    }
}

struct BusinessDetail_Previews: PreviewProvider {
    static let network = Network()
    //network.getBusinesses(location: "Norwalk%20CT")
    static var previews: some View {
        
        Text("Hello \(network.businesses.count)")
        
        
    }
}
