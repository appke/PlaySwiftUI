//
//  ContentView2.swift
//  Essentials
//
//  Created by MGBook on 2020/4/16.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

// 跨容器对齐，自定义Alignment
// 系统自带的Aligment，跨容器无效
struct CustomHorizontalAlignment: AlignmentID {
    // 默认偏移量，默认左对齐，偏移量为 0
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context[.leading]
    }
}

extension HorizontalAlignment {
    // 自定义水平对齐类型，创建 HorizontalAlignment
    static let customLeading = HorizontalAlignment(CustomHorizontalAlignment.self)
}

// 2.Text对齐
struct ContentView2 : View {
    var body: some View {
        VStack(alignment: .customLeading) { //基准线
            HStack {
                Text("Username").titleStyle()
                Text("Jackay").contentStyle()
            }
            
            HStack {
                Text("Email").titleStyle()
                Text("Jackay@gmail.com").contentStyle()
            }
            
            HStack {
                Text("Phone").titleStyle()
                Text("400-2828-897").contentStyle()
            }
        }
        .padding()
    }
}

// 设置扩展函数，设置文字样式
extension Text {
    func titleStyle() -> Self {
        self.font(.system(size: 35, weight: .bold))
    }
    
    // 右侧文字左对齐，和最外层VStack 共享同一条基准线
    func contentStyle() -> some View {
        self.font(.system(size: 25))
        .border(Color.red)
        .alignmentGuide(.customLeading, computeValue: { $0[.leading] })
    }
}


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
