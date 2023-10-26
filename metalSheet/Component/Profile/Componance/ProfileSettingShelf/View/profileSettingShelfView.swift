//
//  profileView.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
import SwiftUI

struct profileSettingShelfView: View {
    @State private var isPresented = false
    @State private var confirmationAction: ConfirmationAction? = nil
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    settingView()

                    forLoopSettingBtnView()
                    
                    Button {
                        confirmationAction = .logout
                        isPresented = true
                    } label: {
                        signOutBtnView()
                    }.confirmationDialog("ต้องการออกจากระบบ?", isPresented: $isPresented, titleVisibility: .visible, actions: {
                        Button("ยืนยัน", role: .destructive) {
                            if confirmationAction == .logout { // Only dismiss if the user confirms
                                 loginViewModel.logoutUser() // Call a function to handle user logout
                              presentationMode.wrappedValue.dismiss()
                            }// Set the user as logged out
                        }
                        Button("ยกเลิก", role: .cancel) {
                        
                            confirmationAction = nil
                            isPresented = false
                        }
                    })

                    
                    Spacer()
                }
                .background(Color.white)
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 80)
            }
            }.background(Color(.white))
      
        }
        .accentColor(Color.black)
      
    
    }

}

enum ConfirmationAction {
    case logout
}




