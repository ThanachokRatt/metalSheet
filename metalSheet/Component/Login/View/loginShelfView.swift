//
//  ContentView.swift
//  metalSheet
//
//  Created by Schweppe on 21/8/2566 BE.
//

import SwiftUI

struct loginShelfView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggingIn = false
    @State private var textLoginButton = "ล็อคอินเข้าสู่ระบบ"
    @State private var isPresentingAllView = false
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    @EnvironmentObject  var addProductViewModel: AddProductViewModel
    @EnvironmentObject var personalViewModel: PersonalViewModel
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    let green: String = "green123"
    let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        NavigationStack{
            ZStack {
                Color(green)
                    .ignoresSafeArea()
                    .opacity(0.8)
                Circle()
                    .scaleEffect(isiPad ? 1.4 : 1.7)
                    .foregroundColor(.white.opacity(0.3))
                Circle()
                    .scaleEffect(isiPad ? 1.1 : 1.4)
                    .foregroundColor(.white)
                
                VStack {
                    textfieldLoginView(email: $email, password: $password)
                        .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                    Text("\(loginViewModel.errorMessageLogin)")
                        .foregroundColor(Color.red)
                        .font(.subheadline)
                   
                    
                    if isLoggingIn {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .background(Color.white)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        
                    }
                    Button(action: {
                        var user = LoginModel()
                        user.email = email
                        user.password = password
                        isLoggingIn = true
                        
                        self.loginViewModel.loginUser(user: user) {
                            // This closure is called when the login operation is completed
                            isLoggingIn = false
                            if loginViewModel.loginSuccess == true{
                                email = ""
                                password = ""
                            }
                            
                        }
                        
                    }) {
                        loginButtonView()
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    }
                    
                    
                    
                    
                    registerButtonInLoginView()
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                }
                
                
            }
            .accentColor(Color(.black))
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct loginVie_Previews: PreviewProvider {
    static var previews: some View {
        loginShelfView()
            .environmentObject(LoginViewModel())
            .environmentObject(LocationViewModel())
            .environmentObject(AddProductViewModel())
            .environmentObject(PersonalViewModel())
    }
}
