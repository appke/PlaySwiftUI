//
//  ViewController.swift
//  playSwiftUI
//
//  Created by MGBook on 2019/10/30.
//  Copyright © 2019 MGBook. All rights reserved.
//

import UIKit
import SwiftUI


//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        Button(action: {
//            print("-----1")
//
//        }) {
//            Text("Buttonaaa")
//        }
//    }
//}


struct ContentView : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("123abcde----11")
                .font(.largeTitle)
                .foregroundColor(Color.red)
            HStack {
                Text("水平方向----111")
                    .font(.subheadline)
                Spacer()
                Text("水平方向----222")
                    .font(.subheadline)
                
            }
        }
        .padding()
    }
}



#if DEBUG
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        //Text("Hello, World!333")
        ContentView()
                
    }
}
#endif
