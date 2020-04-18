//
//  ProfileHost.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/18.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var profile = Profile.default
    
    var body: some View {
        // Text("Profile for: \(profile.username)")
        ProfileSummary(profile: self.profile)
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
