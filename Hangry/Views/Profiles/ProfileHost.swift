//
//  ProfileHost.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/1/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
//    @Environment(\.dismiss) var dissmiss
    @EnvironmentObject var network: Network

    @State private var draftProfile = Profile.default
    @Binding var location: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = network.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: network.profile, location: $location)
            } else {
                ProfileEditor(profile: $draftProfile, location: $location)
                    .onAppear{
                        draftProfile = network.profile
                    }
                    .onDisappear{
                        network.profile =  draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(location: .constant("Norwalk CT"))
            .environmentObject(Network())
    }
}
