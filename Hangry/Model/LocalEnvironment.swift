//
//  Environment.swift
//  Hangry
//
//  Created by Bryan Tacuri on 6/28/23.
//

import Foundation

//This is a utility struct that provides a method for reading environment variables from a .env file located in the main bundle of your application.
struct LocalEnvironment {
    static func variable(named name: String) -> String? {
        guard let filePath = Bundle.main.path(forResource: ".env", ofType: nil) else {
            return nil
        }
        
        do {
            let contents = try String(contentsOfFile: filePath)
            let lines = contents.components(separatedBy: .newlines)
            
            for line in lines {
                let components = line.components(separatedBy: "=")
                if components.count == 2, components[0].trimmingCharacters(in: .whitespacesAndNewlines) == name {
                    return components[1].trimmingCharacters(in: .whitespacesAndNewlines)
                }
            }
        } catch {
            print("Error reading .env file: \(error)")
        }
        return nil
    }
}
