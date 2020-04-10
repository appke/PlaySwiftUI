//
//  ContentView.swift
//  PlaySwiftUI
//
//  Created by MGBook on 2020/4/8.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI


struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top) //刘海显示地图
            
            CircleImage(image: landmark.image)
                .offset(y: -130) //原来的图片形状还占着坑呢，layer看上去是向上了
                .padding(.bottom, -130) //底部填充-130 的空间
            
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer() //地图顶上去
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[3])
    }
}
