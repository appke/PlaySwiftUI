//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/9.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

/**
 {
     "name": "Turtle Rock",
     "category": "Rivers",
     "city": "Twentynine Palms",
     "state": "California",
     "id": 1001,
     "isFeatured": true,
     "isFavorite": true,
     "park": "Joshua Tree National Park",
     "coordinates": {
         "longitude": -116.166868,
         "latitude": 34.011286
     },
     "imageName": "turtlerock"
 },
 */
struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            // 是否被收藏
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
