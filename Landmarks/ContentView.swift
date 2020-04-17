//
//  ContentView.swift
//  Essentials
//
//  Created by MGBook on 2020/4/16.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

// 1.Text对齐
struct ContentView : View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
