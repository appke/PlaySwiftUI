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

// 2.Text对齐
struct ContentViewH : View {
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Text("Username").font(Font.system(size: 35, weight: .bold)).border(Color.red)
                Text("Jackay").font(Font.system(size: 25))
            }

            
            HStack {
                Text("Email").font(Font.system(size: 35, weight: .bold))
                Text("Jackay@gmail.com").font(Font.system(size: 25)).border(Color.red)
            }
            
            HStack {
                Text("Phone").font(Font.system(size: 35, weight: .bold))
                Text("400-2828-897").font(Font.system(size: 25))
            }
        }
        .padding()
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
            .clipped() //带阴影的矩形
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
//        ContentViewH()
        ShadowView()
    }
}
