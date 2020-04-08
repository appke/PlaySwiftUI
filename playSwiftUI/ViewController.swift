//
//  ViewController.swift
//  playSwiftUI
//
//  Created by MGBook on 2019/10/30.
//  Copyright © 2019 MGBook. All rights reserved.
//

import UIKit
import SwiftUI

// 1.Text对齐
struct ContentViewV : View {
    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text("Username").border(Color.red)
                Text("Email")
                Text("Phone")
            }
            .font(Font.system(size: 35, weight: .bold))
            
            VStack(alignment: .leading) {
                Text("Jackay").frame(maxHeight: .infinity).border(Color.red)
                Text("Jackay@gmail.com").frame(maxHeight: .infinity)
                Text("400-2828-897").frame(maxHeight: .infinity)
            }
            .font(.system(size: 25))
        }
    .fixedSize()
    }
}

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
struct ContentViewH : View {
    var body: some View {
        VStack(alignment: .customLeading) { // 基准线
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

// SF字体
struct SF_ContentView : View {
    let name = "sun.max"
    var body: some View {
        VStack(spacing: 45) {
            Image(systemName: name) //SF系统自带图片
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            
            Image(systemName: name)
            .resizable()
            .scaledToFit()
            .frame(width: 90, height: 90)

            
            Image(systemName: name)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            
            
            Image(systemName: name)
                .font(Font.system(size: 60, weight: .bold))
            
            Image(systemName: name)
                .font(Font.system(size: 60, weight: .thin))

        }
    }
}

//MARK:- 阴影使用
struct ShadowView : View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Text 11")
                Text("Text 22")
                //.shadow(color: Color.red, radius: 10, x: 0, y: 0)
            }
            .font(.system(size: 35))
            .padding()
            .background(Color.white)
            .clipped() //带阴影的矩形，放在设置背景后面
            .shadow(color: .red, radius: 10)
            
//            .background(
//                //Color.white.shadow(color: .red, radius: 10, x: 0, y: 0)
//                RoundedRectangle(cornerRadius: 20)
//                    .foregroundColor(.white)
//                    .shadow(color: .red, radius: 10)
//
//            )
            
            Spacer()
            
            
            VStack {
                Text("Text 33")
                Text("Text 44")
                //.shadow(color: Color.red, radius: 10, x: 0, y: 0)
            }
            .font(.system(size: 35))
            .padding()
            .background(Color.white)
            .cornerRadius(10) //带阴影的圆角矩形
            .shadow(color: .red, radius: 10)

            
            Spacer()
            
            
            VStack {
                Text("Text 55")
                Text("Text 66")
                //.shadow(color: Color.red, radius: 10, x: 0, y: 0)
            }
            .font(.system(size: 35))
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10, y:5)
            // 实际项目，透明黑色、带圆角
        
            Spacer()
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        //Text("Hello, World!333").font(Font.system(size: 35))
//        ContentViewV()
//        SF_ContentView()
        ContentViewH()
//        ShadowView()
    }
}
