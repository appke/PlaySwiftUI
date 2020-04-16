//
//  ContentView3.swift
//  Essentials
//
//  Created by MGBook on 2020/4/16.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

// 自定义Alignment
struct CustomHorizontalCenter: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat { context[HorizontalAlignment.center] }
}

extension HorizontalAlignment {
    static let customCenter = HorizontalAlignment(CustomHorizontalAlignment.self)
}


// 3.View对齐技巧3
struct ContentView3: View {
    let categorites: [String] = ["推荐", "热门", "学习", "iOS", "Android"]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        
        VStack(alignment: .customCenter, spacing: 3) {
            HStack {
                ForEach(categorites.indices, id: \.self) { index in
                    Text(self.categorites[index])
                        .alignCenterHorizonally(index == self.selectedIndex)
                        .foregroundColor(index == self.selectedIndex ? .orange : .black)
                        .onTapGesture {
                            withAnimation {
                                self.selectedIndex = index
                            }
                    }
                }
            }
            .font(.title)
            
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 20, height: 8)
                .foregroundColor(.orange)
                .alignCenterHorizonally(true)
                //.alignmentGuide(.customCenter) { $0[HorizontalAlignment.center] }
//                .alignmentGuide(.customCenter, computeValue: { $0[HorizontalAlignment.center] })
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

// 扩展函数，居中对齐
extension View {
    func alignCenterHorizonally(_ align: Bool) -> some View {
        if align {
            return AnyView(self.alignmentGuide(.customCenter) { $0[HorizontalAlignment.center] })
        }
        return AnyView(self)
    }
}
