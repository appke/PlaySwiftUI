//
//  AlignmentView.swift
//  Essentials
//
//  Created by MGBook on 2020/4/16.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI
// 对齐
// View 与基准线，偏移量表示



struct HLabel: View {
    let text: String
    let backgroundColor: Color
    let width: CGFloat
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .frame(width: width)
            .padding(.vertical)
            .background(backgroundColor)
    }
}

struct ExampleViewH: View {
    var body: some View {
        VStack(alignment: .leading) {
            HLabel(text: "0", backgroundColor: .gray, width: 100)
            HLabel(text: "1", backgroundColor: .red, width: 120)
                .alignmentGuide(.leading, computeValue: { $0[.leading] })
            HLabel(text: "2", backgroundColor: .yellow, width: 140)
                .alignmentGuide(.leading, computeValue: { $0[HorizontalAlignment.center] })
            
            HLabel(text: "3", backgroundColor: .green, width: 160)
                .alignmentGuide(.leading, computeValue: { $0[.trailing] })
            
            HLabel(text: "4", backgroundColor: .blue, width: 180)
                .alignmentGuide(.leading, computeValue: { _ in 60 })
            
            HLabel(text: "5", backgroundColor: .purple, width: 200)
                .alignmentGuide(.trailing, computeValue: { _ in 60 })
        }
    }
}

struct ExampleViewV: View {
    var body: some View {
        Text("22")
    }
}


struct AlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleViewH()
    }
}
