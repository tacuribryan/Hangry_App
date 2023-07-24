//
//  HangryApp.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/1/23.
//

import SwiftUI

@main
struct HangryApp: App {
    
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
