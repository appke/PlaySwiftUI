//
//  MapView.swift
//  playSwiftUI
//
//  Created by MGBook on 2020/3/27.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
//    func makeUIView(context: Context) -> some UIView {
//        MKMapView(frame: .zero)
//    }
//    
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        let coordinate = CLLocationCoordinate2D(latitude: 22, longitude: 114)
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        uiView.setRegion(region, animation: true)
//    }
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
        .shadow(radius: 10)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
