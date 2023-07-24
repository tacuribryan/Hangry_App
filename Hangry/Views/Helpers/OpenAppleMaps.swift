//
//  OpenAppleMaps.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/11/23.
//

import Foundation
import UIKit
import CoreLocation
/**
 This will open maps with the address that is passed down.
 
 */
struct OpenAppleMaps {
    func openMap(Address:String) {
        let encodedAddres = Address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(encodedAddres)")! as URL)
    }
    
    func calculateDistance(MyLocation: String, ToLocation: String) {
        
    }
}
