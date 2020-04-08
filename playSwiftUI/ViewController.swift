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



struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        //Text("Hello, World!333").font(Font.system(size: 35))
//        ContentViewV()
//        SF_ContentView()
        ContentViewH()
    }
}
