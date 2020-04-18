//
//  UserData.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/13.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesonly = false
    @Published var landmarks = landmarkData
}
