//
//  ViewController.swift
//  PlaySwiftUI
//
//  Created by MGBook on 2019/10/30.
//  Copyright © 2019 MGBook. All rights reserved.
//

import UIKit
import SwiftUI


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
        SF_ContentView()
//        ShadowView()
    }
}
