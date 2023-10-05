//
//  profileView.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
import SwiftUI

struct profileSettingShelfView: View {
   
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            VStack {
                settingView()

                forLoopSettingBtnView()

                signOutBtnView()
                Spacer()
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
      
        }
        .accentColor(Color.black)

    
    }

}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        profileSettingShelfView()
            .environmentObject(LocationViewModel())
    }
}




