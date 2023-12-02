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
    @State private var isLogoutAlertPresented = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    settingView()

                    forLoopSettingBtnView()
                    
                    Button {
                                    isLogoutAlertPresented = true
                                } label: {
                                    signOutBtnView()
                                }
                                .alert("ต้องการออกจากระบบหรือไม่?", isPresented: $isLogoutAlertPresented) {
                                    Button("ยืนยัน") {
                                        loginViewModel.logoutUser()
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    Button("ยกเลิก", role: .cancel) {
                                        isLogoutAlertPresented = false
                                    }
                                }

                                Spacer()
                            }
                            .background(Color.white)
                            .safeAreaInset(edge: .bottom) {
                                Color.clear.frame(height: 120)
                            }
                            .ignoresSafeArea()
                        }
                        .background(Color(.white))
                    }
                    .accentColor(Color.black)
                }
            }

enum ConfirmationAction {
    case logout
}




