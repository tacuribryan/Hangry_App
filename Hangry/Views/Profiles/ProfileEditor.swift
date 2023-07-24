//
//  ProfileEditor.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/1/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    @Binding  var location: String
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            HStack {
                Text("Location").bold()
                Divider()
                TextField("Location", text: $location)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
//        ProfileEditor(profile: .constant(.default))
        ProfileEditor(profile: .constant(.default), location: .constant("Norwalk CT"))
    }
}
