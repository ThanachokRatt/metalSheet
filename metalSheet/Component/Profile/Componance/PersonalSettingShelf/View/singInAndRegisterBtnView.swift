//
//  singInAndRegisterBtnView.swift
//  metalSheet
//
//  Created by Schweppe on 6/12/2566 BE.
//

import SwiftUI

struct singInAndRegisterBtnView: View {
    @State private var isLoginSheetPresented = false
    let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        VStack{
            Text("คุณยังไม่ได้เข้าสู่ระบบ")
                .foregroundColor(Color("lipstick"))
                .font(.system(size: isiPad ? 30 : 20))
            
            Button(action: {
                isLoginSheetPresented.toggle()
            }, label: {
                VStack (spacing: 5){
                    
                    Text("เข้าสู่ระบบ/สมัครสมาชิก")
                        .font(.system(size:isiPad ? 28 : 18, weight: .bold))
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                
                .background(Color("lipstick"))
                
                .shadow(radius: 3)
                .cornerRadius(10)
                
            })
            .sheet(isPresented: $isLoginSheetPresented){
                loginShelfView()
            }
            
            .padding(.horizontal,80)
        }
    }
}

/*#Preview {
   singInAndRegisterBtnView()
}*/
