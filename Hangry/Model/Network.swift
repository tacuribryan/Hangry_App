//
//  Restaurant.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/6/23.
//

import Foundation

class Network: ObservableObject {
    @Published var businesses: [Business] = []
    @Published var profile = Profile.default
    @Published var isLoading = false
    func getBusinesses (location: String, keyword: String){
        isLoading = true
        
        guard let bearerToken = LocalEnvironment.variable(named: "BEARER_TOKEN") else {
            fatalError("Bearer token not found in environment variables")
        }
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer \(bearerToken)"
        ]
        /*
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/businesses/search?location=Norwalk%20CT&sort_by=best_match&limit=20")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        */
        //https://api.yelp.com/v3/businesses/search?location=\(location)&sort_by=best_match&limit=20
//      https://api.yelp.com/v3/businesses/search?term=pizza&location=\(location)
//      https://api.yelp.com/v3/businesses/search?location=\(location)&open_now=true&limit=20
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=\(keyword)&location=\(location)&radius=16093&open_now=true&sort_by=rating") else {fatalError("Missing URL")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                self.isLoading = false
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                self.isLoading = false
                return
            }
            print("RESPONSE: ", response.statusCode)
            
            if response.statusCode == 200 {
                guard let data = data else {
                    self.isLoading = false
                    return
                }
                //print("DATA: ", String(data: data, encoding: .utf8)!)
                DispatchQueue.main.async {
                    do {
                        let decodedResponse = try JSONDecoder().decode(YelpResponse.self, from: data)
                        self.businesses = decodedResponse.businesses
                        print("RESTAURANTS: ", self.businesses)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                    self.isLoading = false
                }
            } else {
                self.isLoading = false
            }
        }
        dataTask.resume()
        
    }
}
