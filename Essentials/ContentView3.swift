//
//  ContentView3.swift
//  Essentials
//
//  Created by MGBook on 2020/4/16.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

// 3.View对齐技巧3
struct ContentView3: View {
    let categorites: [String] = ["推荐", "热门", "学习", "iOS", "Android"]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                ForEach(categorites.indices, id: \.self) { index in
                    Text(self.categorites[index])
                }
            }
            .font(.title)
            
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 20, height: 6)
                .foregroundColor(.orange)
        }

    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
