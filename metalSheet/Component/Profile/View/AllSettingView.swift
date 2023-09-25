//
//  AllSettingView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI
struct AllSettingView: View {
    @AppStorage("selectedTab") var selectedTab: settingTab = .addressSetting

    var body: some View {
        VStack {
            profileView()
        }
    }
}


struct AllSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AllSettingView()
    }
}
