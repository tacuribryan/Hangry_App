//
//  ContentView.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/1/23.
//

import SwiftUI
import CoreLocationUI
import MapKit



struct ContentView: View {
    @EnvironmentObject var network: Network
    @State private var showingProfile = false
    @State public var location = "Queens NY"
    @State public var keyword: String = "Pizza"
    @StateObject private var viewModel = ContentViewModel()
    
    
    

    var body: some View {
        var searchLocation = viewModel.currentAddress ?? location
        
            NavigationView {
                VStack(alignment: .center) {
                    NavigationLink {
                        // destination view to navigation to
                        RestaurantList(keyword: $keyword, location: $location)
                    } label: {
//                        Text("Restaurant List")
                        NavButton(title: "Restaurant's Nearby", foreground: .black, background: .white)
                    }
                    
                    NavigationLink {
                        // destination view to navigation to
                        HelpMePick(location: $location)
                    } label: {
//                        Text("Help Me Pick 🤔")
                        NavButton(title: "Help Me Pick 🤔", foreground: .black, background: .white)
                    }
                    
                    NavigationLink {
                        // destination view to navigation to
                        Food101Prediction()
                    } label: {
//                        Text("Help Me Pick 🤔")
                        NavButton(title: "Name of Dish", foreground: .black, background: .white)
                    }
                    NavigationLink {
                        // destination view to navigation to
                        Food101Prediction()
                    } label: {
//                        Text("Help Me Pick 🤔")
                        NavButton(title: "TODO 2", foreground: .black, background: .white)
                    }
                    
                    if viewModel.isLoadingLocation {
                        Text("Loading location, please wait!")
                        ProgressView()
                            .foregroundColor(.white)
                            .padding()
                    } else {
                        Text(searchLocation)
                            .onChange(of: viewModel.currentAddress) { newLocation in
                                guard let newAddress = newLocation else { return }
                                location = newAddress
                            }
                        LocationButton(.currentLocation){
                            viewModel.requestAllowOnceLocationPermission()
                        }
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        //TitleAndIcon is default
                        //                    .labelStyle(.titleAndIcon)
                        .symbolVariant(.fill)
                        .padding()
                    }
                    
//                    .padding(.bottom, 50)
                    
                }
                
                .navigationBarTitle("The Hangry App 😋", displayMode: .inline)
                .toolbar{
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost(location: $location)
                        .environmentObject(network)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
