//
//  registerView.swift
//  metalSheet
//
//  Created by Schweppe on 25/8/2566 BE.
//

import SwiftUI

struct registerShlefView: View {
    @State private var isPresented1 = false
    let options = ["ลูกค้า", "ช่าง"]
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            VStack{
                
                textfieldView()
                
                checkboxView()
                
                Button(action: {
                 
                    isPresented1 = true
                }){
                    registerButtonView()
                }
              
                
                   
            }
            .fullScreenCover(isPresented: $isPresented1, content: {
                loginShelfView()
            }
            
        )
        }}
}
struct BackgroundView: View {
    var body: some View {
        
      
        GeometryReader { geometry in
            Circle()
                .fill(Color("red1").opacity(0.4))
            
                .scaleEffect(2)
            
                .offset(y: -geometry.size.height*0.6)
            
           
        }
        GeometryReader { geometry in
            Circle()
                .fill(Color("slgreen").opacity(0.3))
            
                .scaleEffect(2)
            
                .offset(x: -geometry.size.height*0.4)
            
           
        }
        
    }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerShlefView()
    }
}
