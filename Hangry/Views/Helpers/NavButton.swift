//
//  NavButton.swift
//  Hangry
//
//  Created by Bryan Tacuri on 5/24/23.
//

import SwiftUI

struct NavButton: View {
    let title: String
    let foreground: Color
    let background: Color
    
    var body: some View {
        Text(title)
            .font(.system(size:25))
            .fontWeight(.bold)
            .foregroundColor(foreground)
            .frame(minWidth: 0, maxWidth: 350, maxHeight: 75)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(background)
                    .shadow(color: .gray, radius: 4, x:0, y: 0)
            )
    }
}

struct NavButton_Previews: PreviewProvider {
    static var previews: some View {
        NavButton(title: "Name of Dish", foreground: .black, background: .white)
    }
}
