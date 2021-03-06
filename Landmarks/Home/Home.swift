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
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // 缩放并裁剪后的地标特征图片
                // 被标记了 isFeatured 的地标
//                FeaturedLandmarks(landmarks: featured)
//                    .scaledToFill() //全部填充
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets()) //设置zero ,内容展开到显示边缘
                PageView(features.map{ FeatureCard(landmark: $0) })
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())

                ForEach(categories.keys.sorted(), id: \.self) { key in
                    //Text(key)
                    CategoryRow(categoryName: key, items: self.categories[key]!).environmentObject(self.userData)
                }
                .listRowInsets(EdgeInsets()) //内容展开到显示边缘
                
                // 链接到列表
                NavigationLink(destination: LandmarkList().environmentObject(self.userData)) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost().environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedLandmarks :View {
    let landmarks: [Landmark]
    
    var body: some View {
        landmarks[0].image
            .resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
