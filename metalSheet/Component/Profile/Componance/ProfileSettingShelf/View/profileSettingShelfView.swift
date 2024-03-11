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
    @EnvironmentObject var personalViewModel: PersonalViewModel
    @State private var isLogoutAlertPresented = false
    @State private var isDeleteUserAlertPresented = false
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
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
					Button{
						isDeleteUserAlertPresented = true
					} label: {
						btnView(image: "deleteLogo", name: "ลบบัญชีผู้ใช้งาน")
							.font(Font.custom("Pridi-Light",size: isiPad ? 27 : 18))
					}
					.alert("ต้องการลบบัญชีผู้ใช้งานและออกจากระบบหรือไม่?", isPresented: $isDeleteUserAlertPresented ) {
						Button("ยืนยัน") {
							personalViewModel.deteleUser()
							loginViewModel.logoutUser()
							presentationMode.wrappedValue.dismiss()
						}
						Button("ยกเลิก", role: .cancel) {
							isDeleteUserAlertPresented = false
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
                    
                }
            }

enum ConfirmationAction {
    case logout
}




