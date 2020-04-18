//
//  HikeView.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/14.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true
    
    var body: some View {
    
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height:30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                    
                }
                Spacer()
                
                Button(action: {
                    //self.showDetail.toggle()
                    withAnimation (.spring()) {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        //.animation(.spring())
                }
            }
                
            if showDetail {
                HikeDetail(hike: hike)
                    //.transition(.slide)
                    //.transition(.move(edge: .leading))
                    .transition(.moveAndFade)
            }
        }
    }
}

// 自定义转场动画
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[0])
                .padding()

            Spacer()
        }
    }
}
