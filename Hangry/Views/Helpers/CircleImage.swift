//
//  CircleImage.swift
//  Hangry
//
//  Created by Bryan Tacuri on 3/27/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        //Text("Hello")
        
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            //.frame(width: 50, height: 50)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: URL(string: "https://s3-media2.fl.yelpcdn.com/bphoto/pXJ4caIqqjeI-pOtfPOsQQ/o.jpg")) { image in
            CircleImage(image: image)
        } placeholder: {
            ProgressView()
        }
    }
}
