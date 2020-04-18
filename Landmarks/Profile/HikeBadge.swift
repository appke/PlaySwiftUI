//
//  HikeBadge.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/18.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100) //同效果缩小
            
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)"))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
