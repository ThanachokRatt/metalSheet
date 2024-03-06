//
//  loginViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 2/10/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class LoginViewModel: ObservableObject {
    @Published var successMessageLogin = ""
    @Published var errorMessageLogin = ""
    
    @Published var email = ""
    @Published var token = ""
    @Published var name: String = ""
    @Published var phone: String = ""
	@Published var id: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var loginSuccess = false
    @Published var passWord: String = ""
    
    
    init() {
        // Load isLoggedIn value from UserDefaults when the ViewModel is initialized
        loadLoggedIn()
        loadUserId()
        loadUserName()
        loadUserPhone()
        loadUserEmail()
        loadUserPassword()
    }

    // Function to set isLoggedIn and save it to UserDefaults
    func setLoggedIn(_ value: Bool) {
        isLoggedIn = value
        UserDefaults.standard.set(value, forKey: "isLoggedIn")
    }

    // Function to retrieve isLoggedIn from UserDefaults
    func loadLoggedIn() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func setUserId(_ value: String) {
        id = value
        UserDefaults.standard.set(value, forKey: "userId")
        UserDefaults.standard.synchronize()
    }
    
    func loadUserId() {
        
		id = UserDefaults.standard.string(forKey: "userId") ?? ""
        }
    
    func setUserName(_ value: String){
        name = value
        UserDefaults.standard.set(value,forKey: "userName")
        
    }
    func loadUserName(){
        if let userName = UserDefaults.standard.string(forKey: "userName") {
                name = userName
            }
    }
    
    func setUserPhone(_ value: String){
       phone = value
        UserDefaults.standard.set(value,forKey: "userPhone")
        
    }
    func loadUserPhone(){
        if let userPhone = UserDefaults.standard.string(forKey: "userPhone") {
                phone = userPhone
            }
    }
    
    func setUserEmail(_ value: String){
       email = value
        UserDefaults.standard.set(value,forKey: "userEmail")
        
    }
    func loadUserEmail(){
        if let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
                email = userEmail
            }
    }
    
    func setUserPassword(_ value: String){
       passWord = value
        UserDefaults.standard.set(value,forKey: "userPassword")
        
    }
    func loadUserPassword(){
        if let userPassword = UserDefaults.standard.string(forKey: "userPassword") {
                passWord = userPassword
            }
    }
  
    
   
    
    

    func loginUser(user: LoginModel, completion: @escaping () -> Void) {
        let userJson = user.toJSON()
       // let apiUrl = "https://domhee-api.onrender.com/api/login"
		let apiUrl = "https://saprachanapi.onrender.com/auth/v1/login"
        AF.request(apiUrl, method: .post, parameters: userJson, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    if let successMessage = json["msg"] as? String {
                        self.successMessageLogin = successMessage
                     //   print(self.successMessageLogin)
                        self.loginSuccess = true
                        self.setLoggedIn(true)
                      
                    }
                    if let data = json["data"] as? [String: Any] {
                        self.id = data["_id"] as? String ?? ""
                        self.email = data["email"] as? String ?? ""
                        self.token = data["token"] as? String ?? ""
                        self.name = data["name"] as? String ?? ""
                        self.phone = data["phone"] as? String ?? ""
                        self.passWord = data["pwd"] as? String ?? ""
                        
                        if let userId = data["_id"] as? String {
                            self.setUserId(userId)
                        }
                        if let userName = data["name"] as? String {
                            self.setUserName(userName)
                        }
                        
                        if let userPhone = data["phone"] as? String{
                            self.setUserPhone(userPhone)
                        }
                        
                        if let userEmail = data["email"] as? String{
                            self.setUserEmail(userEmail)
                        }
                        
                        if let userPassword = data["pwd"] as? String {
                            self.setUserPassword(userPassword)
                        }
                        
                        
                        
                      

                     //   print("ID = :  \(self.id)")
                       // print("Email:  \(self.email)")
                        //print("Token: \(self.token)")
                        //print("Full-Name:  \(self.name)")
                        //print("Phone Number:  \(self.phone)")
                        //print("User Password \(self.passWord)")
                    
                       
                    }

                    if let errorMessage = json["err"] as? String {
                        self.errorMessageLogin = errorMessage
                      //  print(self.errorMessageLogin)
                    }

                    // After successfully logging in, set isLoggedIn to true and save it
                    
              
                }

                completion()
            case .failure(let error):
                print("Login failed with error: \(error)")
                completion()
            }
        }
    }

    func logoutUser() {
        email = ""
        token = ""
        name = ""
        phone = ""
        errorMessageLogin = ""
        loginSuccess = false
        
        setUserEmail("")
        setUserPhone("")
        setUserName("")
        setUserId("")
        setLoggedIn(false)
    }
}
