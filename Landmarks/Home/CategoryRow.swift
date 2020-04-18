//
//  CategoryRow.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/17.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        // 显示分类中的地标
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { item in
                        // Text(item.name)
                        CategoryItem(landmark: item)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    let landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable() //改变图片内容 fit全景
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(5)))
    }
}
