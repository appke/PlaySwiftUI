//
//  LandmarkList.swift
//  PlaySwiftUI
//
//  Created by MGBook on 2020/4/10.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
//    @State var showFavoritesOnly = true
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarkData[1])
//            LandmarkRow(landmark: landmarkData[2])
//            LandmarkRow(landmark: landmarkData[3])
//        }
        
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesonly) {
                    Text("Show Favoirites Only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesonly || landmark.isFavorite {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
//        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
//        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }

        LandmarkList()
            .environmentObject(UserData())
    }
}
