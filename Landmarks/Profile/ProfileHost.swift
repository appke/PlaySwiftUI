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
    // @State var profile = Profile.default
    @EnvironmentObject var userData: UserData
    // 避免在任何编辑确认之前更新 app 的全局状态
    // 例如在用户输入其名称时，编辑 view 只会对其自身的副本进行操作
    @State var draftProfile = Profile.default //草稿副本
    
    
    var body: some View {
        // Text("Profile for: \(profile.username)")
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") { //取消编辑
                        self.draftProfile = self.userData.prodfile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton() //有这个类型？
            }
            
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.prodfile)
            } else {
                // 编辑在用户退出编辑模式之后才生效，编辑期间用草稿副本
                // 然后仅在用户确认编辑时将草稿副本分配给真实副本
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.prodfile
                    }
                    .onDisappear { //点击Cancel按钮时，清空编辑内容
                        self.userData.prodfile = self.draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
