//
//  PageView.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/20.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 1
    
    // 泛型初始化方法接收一个 view 数组，并将每个 view 嵌套在 UIHostingController
    init(_ views: [Page]) {
        self.viewControllers = views.map({ UIHostingController(rootView: $0) })
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            Text("Current Page: \(currentPage)") //显示页码
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map{ FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
