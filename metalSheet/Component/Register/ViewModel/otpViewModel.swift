//
//  otpViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 6/11/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftUI
class OtpViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var role : String = ""
    @Published var userOtp: String = ""
    @Published var errorMessage: String = ""
    @Published var alertMessage: String = ""
    @Published var verifyOtp: String = ""
    @Published  var redirectToOtpView: Bool = false
    
    
    func sendOtp(user: RegisterModel, completion: @escaping () -> Void){
        let userJson = user.toJSON()
       // let apiUrl = "https://domhee-api.onrender.com/api/sendOTP"
		let apiUrl = "https://saprachanapi.onrender.com/auth/v1/register"
        AF.request(apiUrl,method: .post,parameters: userJson,encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
				if let jsonDict = value as? [String: Any] {
					if let successMessage = jsonDict["msg"] as? String,
					   let  code = jsonDict["code"] as? String {
								self.alertMessage = successMessage
								self.verifyOtp = code
							  //  print("alert: \(self.alertMessage)")
								print("otp: \(self.verifyOtp)")
						self.redirectToOtpView = true
						
					}
                    
                };if let jsonDict = value as? [String: Any],
                         let Message = jsonDict["err"] as? String {
                         self.errorMessage = Message
                         self.redirectToOtpView = false
                        // print(self.errorMessage)
                }
                completion()
            case .failure(let error):
                self.alertMessage = ( "Registration failed with error:\n \(error)")
                completion()
            }
        }
        
    }
    func setErrorMessage(){
        errorMessage  = ""
    }
    
}
