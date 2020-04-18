//
//  CategoryHome.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/17.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

// 显示地标分类和特征
struct CategoryHome: View {
    // 把地标组合到分类中
    // 一个分类里有多个，同类型的
    var categories: [String: [Landmark]] {
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue } //共4个分类
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    //Text(key)
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
