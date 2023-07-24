//
//  ProfileSummary.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/1/23.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var network: Network
    var profile: Profile
    @Binding var location: String
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Today's Date: ") + Text(profile.goalDate, style: .date)
                Text("Location: \(location)")
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Favorite Food")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Text("TODO1 🍕")
                            Text("TODO2 🍔")
                            Text("TODO3 🍣")
                            Text("TODO4 🍗")
                            Text("TODO5 🍝")
                        }
                        .padding(.bottom)
                    }
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Visited Restaurants")
                        .font(.headline)
                    
                    Text("TODO: This area is to show visited restaurants")
                }
            }
        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default, location: .constant("Norwalk CT"))
            .environmentObject(Network())
    }
}
