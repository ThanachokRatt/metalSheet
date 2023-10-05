//
//  profileViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 10/9/2566 BE.
//

import Foundation
struct ProfileModel: Identifiable{
    let id = UUID()
    let profileImage: String
    let profileName: String
    let tab: settingTab
}


class ProfileViewModel: ObservableObject{
    @Published var profileModel: [ProfileModel] = []
    
    init() {
        profileModel.append(ProfileModel(profileImage: "userLogo", profileName: "จัดการข้อมูลส่วนตัว",tab: .userSetting))
        profileModel.append(ProfileModel(profileImage: "busLogo", profileName: "จัดการที่อยู่จัดส่ง",tab: .addressSetting))
        profileModel.append(ProfileModel(profileImage: "passwordLogo", profileName: "เปลี่ยนรหัสผ่าน",tab :.chagePassword))
      
        
    }
}
