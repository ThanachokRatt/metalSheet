//
//  ContentView.swift
//  metalSheet
//
//  Created by Schweppe on 21/8/2566 BE.
//

import SwiftUI

struct loginShelfView: View {
   
   // @State private var responseText = ""
    
    var body: some View {
            ZStack {
                Color("green123")
                    .ignoresSafeArea()
                    .opacity(0.8)
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.3))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white)
                
                VStack {
                    textfieldLoginView()
                        .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                    
                    loginButtonView()
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                 
                    
                    registerButtonInLoginView()
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                  
                }
            

        }
        .accentColor(Color(.black))
        .navigationViewStyle(StackNavigationViewStyle())
 
    }
    
/*    func connectToAPI() {
        guard let url = URL(string: "https://domhee-api.onrender.com/api/v1/test/1") else {
            responseText = "Invalid URL"
            return
        }
        
        let credentials = "\(username):\(password)"
        guard let credentialsData = credentials.data(using: .utf8) else {
            responseText = "Invalid credentials"
            return
        }
        
        let base64Credentials = credentialsData.base64EncodedString()
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                responseText = "Error: \(error.localizedDescription)"
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    responseText = "Response: \(responseString)"
                } else {
                    responseText = "Invalid response data"
                }
            }
        }.resume()
    }*/
}

struct loginVie_Previews: PreviewProvider {
    static var previews: some View {
        loginShelfView()
    }
}
