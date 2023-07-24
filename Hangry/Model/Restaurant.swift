
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let restaurant = try? JSONDecoder().decode(Restaurant.self, from: jsonData)

import Foundation
import CoreLocation

// MARK: - Restaurant
struct YelpResponse: Codable{
    let businesses: [Business]
}

// MARK: - Business
struct Business: Codable, Identifiable{
    let id, alias, name: String
    let imageURL: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [Category]
    let rating: Double
    //let coordinates: Center
    let transactions: [Transaction]
//    let price: Price?
    let price: String?
    let location: Location
    let phone, displayPhone: String
    let distance: Double

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories, rating, coordinates, transactions, price, location, phone
        case displayPhone = "display_phone"
        case distance
    }
    
    var coordinates: Center
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

// MARK: - Category
struct Category: Codable {
    let alias, title: String
}

// MARK: - Center
struct Center: Hashable, Codable {
    var latitude, longitude: Double
}

// MARK: - Location
struct Location: Codable {
    let address1: String
//    let address2: Address2?
    let address2: String?
    let address3: String?
//    let city: City
    let city: String
    let zipCode: String
    let country: Country
//    let state: State2
    let state: String
    let displayAddress: [String]

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city
        case zipCode = "zip_code"
        case country, state
        case displayAddress = "display_address"
    }
}

//enum Address2: String, Codable {
//    case empty = ""
//    case steA = "Ste A"
//    case steE = "Ste E"
//}

//enum City: String, Codable {
//    case norwalk = "Norwalk"
//    case southNorwalk = "South Norwalk"
//}

enum Country: String, Codable {
    case us = "US"
}

//enum State2: String, Codable {
//    case ct = "CT"
//}

//enum Price: String, Codable {
//    case empty = "$$"
//    case price = "$$$"
//}

enum Transaction: String, Codable {
    case delivery = "delivery"
    case pickup = "pickup"
    case restaurantReservation = "restaurant_reservation"
}

// MARK: - Region
struct Region: Codable {
    let center: Center
}
