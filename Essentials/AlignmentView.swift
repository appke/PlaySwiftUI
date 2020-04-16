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
/// 有效：alignmentGuide与容器alignment参数相同，才有效
/// 如何对齐：闭包，View与基准线的偏移量
/// $0 表示闭包参数，ViewDimensions可以取下标得到CGFloat
/// $0[.leading] = 0 左对齐
/// 居中对齐，等于View宽度1/2
/// $0[.trailing] 右对齐，等于View宽度
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
            // 左侧超出基准线 60
            HLabel(text: "4", backgroundColor: .blue, width: 180)
                .alignmentGuide(.leading, computeValue: { _ in 60 })
            // 参数不一致，alignmentGuide无效
            HLabel(text: "5", backgroundColor: .purple, width: 200)
                .alignmentGuide(.trailing, computeValue: { _ in 60 })
        }
    }
}

struct VLabel: View {
    let text: String
    let backgroundColor: Color
    let height: CGFloat
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .frame(height: height)
            .padding(.horizontal)
            .background(backgroundColor)
    }
}

struct ExampleViewV: View {
    var body: some View {
        
        HStack (alignment: .top) {
            VLabel(text: "0", backgroundColor: .gray, height: 100)
            VLabel(text: "1", backgroundColor: .red, height: 120)
                .alignmentGuide(.top, computeValue: { $0[.top] })
            VLabel(text: "2", backgroundColor: .yellow, height: 140)
                .alignmentGuide(.top, computeValue: { $0[VerticalAlignment.center] })
            
            VLabel(text: "3", backgroundColor: .green, height: 160)
                .alignmentGuide(.top, computeValue: { $0[.bottom] })

            VLabel(text: "4", backgroundColor: .blue, height: 180)
                .alignmentGuide(.top, computeValue: { _ in 60 })
            
            VLabel(text: "5", backgroundColor: .purple, height: 200)
                .alignmentGuide(.bottom, computeValue: { _ in 60 })
        }
    }
}


struct AlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        // ExampleViewH()
        ExampleViewV()
    }
}
