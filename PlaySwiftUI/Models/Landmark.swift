//
//  Landmark.swift
//  PlaySwiftUI
//
//  Created by MGBook on 2020/4/9.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
//    func iamge(forSize size: Int) -> Image {
//        ImageStore.shared.image(name: imageName, size: size)
//    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double //经度
    var longitude: Double //纬度
}

struct Landmark_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
