//
//  personalSettingView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct personalSettingShelfView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var isEditingEnabled = false
    @State private var errorMessage: String = ""
    
    
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack(spacing: 15) {
            headerPersonalView()
            
            textfieldPersonalView(name: $name, phone: $phone, isEditingEnabled: $isEditingEnabled)
            
            if !errorMessage.isEmpty { // Display the error message conditionally
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top)
            }
            
            PersonalButton(isEditingEnabled: $isEditingEnabled, name: $name, phone: $phone, errorMessage: $errorMessage) .onAppear {
                
                name = loginViewModel.name
                phone = loginViewModel.phone
            }
            
            
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button(action: {
                            hideKeyboard()
                        }) {
                            Text("สำเร็จ")
                                .foregroundColor(Color.red)
                                .font(Font.custom("Pridi-Regular",size: isiPad ? 22 : 16))
                                .padding(.horizontal)
                        }
                    }
                }
            }
    }
}


