//
//  RestaurantList.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/25/23.
//

import SwiftUI

struct RestaurantList: View {
    @EnvironmentObject var network: Network
//    @State private var showingProfile = false
//    @State public var location = ContentViewModel().currentAddress ?? "Norwalk CT"
    @State private var isLoading = true
    @State private var showingFilters = false
    
    @Binding var keyword: String
    @Binding var location: String
    
    
    var body: some View {
        //        let originalLocation = "Norwalk CT"
        VStack {
            HStack {
                TextField("What are you hungry for?", text: $keyword, onCommit:{
                    performSearch()
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    performSearch()
                }, label: {
//                    Image(systemName: "magnifyingglass")
//                    Label("Search", systemImage: "magnifyingglass")
                    Text("Search")
                })
                .padding(.trailing)
                
                Button(action: {
                    showingFilters.toggle()
                }, label: {
                    Label("", systemImage: "slider.vertical.3")
                })
                .sheet(isPresented: $showingFilters) {
//                    ProfileHost(location: $location)
//                        .environmentObject(network)
                    NavigationView {
                        SearchFilters()
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Done") {
                                    showingFilters.toggle()
                                }
                            }
                        }
                }
                }
            }
            
            if network.isLoading {
                ProgressView("Loading...")
                    .font(.title)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .onAppear {
//                        network.getBusinesses(location: encodedLocation, keyword: keyword)
//                    }
            } else {
                if network.businesses.isEmpty {
                    Text("We apologize for the inconvenience, but unfortunately, all \(keyword) businesses located within a 10-mile radius from your current location are currently closed. Please search for something else.")
                        .font(.title)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    List {
                        Text(location)
                        ForEach(network.businesses) {business in
                            NavigationLink{
                                BusinessDetail(business: business)
                            } label: {
                                //Text("\(business.name)")
                                BusinessRow(business: business)
                                
                            }
                            .padding(.vertical)
                        }
                    }
                }
            }
        }
        .task { //async
            performSearch()
        }
    }
    private func performSearch() {
        let encodedLocation = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        network.getBusinesses(location: encodedLocation, keyword: keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList(keyword: .constant("food"), location: .constant("Norwalk CT"))
            .environmentObject(Network())
    }
}
