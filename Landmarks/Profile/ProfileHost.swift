//
//  ProfileHost.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/18.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode //值是\.editMode ?
    @State var profile = Profile.default
    // 避免在任何编辑确认之前更新 app 的全局状态
    // 例如在用户输入其名称时，编辑 view 只会对其自身的副本进行操作
    @State var draftProfile = Profile.default //草稿副本
    
    
    var body: some View {
        // Text("Profile for: \(profile.username)")
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                
                EditButton() //有这个类型？
            }
            
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: self.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
