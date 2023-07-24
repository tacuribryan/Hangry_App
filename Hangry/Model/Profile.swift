//
//  Profile.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/1/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.spring
    var goalDate = Date()
    
    static let `default` = Profile(username: "tacuribryan")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String {rawValue}
    }
}
