//
//  ResultView.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/22/23.
//

import SwiftUI

struct ResultView: View {
    @State private var shouldRestart: Bool = false
    @State private var keyword: String
    let selectedOption: String
    
    @Binding var location: String
    
    init(selectedOption: String, location: Binding<String>) {
        self.selectedOption = selectedOption
        _keyword = State(initialValue: selectedOption)
        self._location = location
    }
    
    var body: some View {
        if !shouldRestart {
            VStack {
                Text(location)
                Text("\(selectedOption) sounds so Yummy 😋. Lets go get them 🚙💨 ")
                    .font(.title)
                    .padding()
                
                //                Text(selectedOption)
                //                    .font(.headline)
                //                    .padding()
                //                    .foregroundColor(.black)
                
                NavigationLink(destination: RestaurantList(keyword: $keyword, location: $location)) {
                    Text("Find me food 📍")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .opacity(shouldRestart ? 0 : 1)
                }
                
                Button("Start Over") {
                    shouldRestart = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                .opacity(shouldRestart ? 0 : 1)
            }
        } else {
            HelpMePick(location: $location)
                .transition(.opacity)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(selectedOption: "Pizza", location: .constant("Norwalk Ct"))
    }
}
