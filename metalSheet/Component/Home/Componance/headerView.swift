//
//  backgroundOfHomePageView.swift
//  metalSheet
//
//  Created by Schweppe on 27/8/2566 BE.
//

import SwiftUI

struct headerView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        HStack {
            if loginViewModel.isLoggedIn{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: isiPad ? 35 : 30 , height: isiPad ? 35 : 30)
                    .padding(EdgeInsets(top: -15, leading: 35, bottom: 0, trailing: 0))
                Text("\(loginViewModel.name)")
                    .font(Font.custom("Pridi-Regular",size: isiPad ? 25 : 17))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 6, trailing: 0))
            }else{
                Image(systemName: "")
                    .resizable()
                    .frame(width: isiPad ? 35 : 30 , height: isiPad ? 35 : 30)
                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 20, trailing: 0))
                Text("\(loginViewModel.name)")
                    .font(.system(size: isiPad ? 24 : 16, weight: .bold))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 6, trailing: 0))
            }
           
            Spacer()
            HStack{
				FaceBookButton()
                LineButton()
            }
           
                .padding(.bottom,15)
                .padding(.trailing,15)
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        
            .foregroundColor(Color.white)
            .background(
                Color("green123")
                    .opacity(0.7)
                    
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
            )
           
    }
}

/*struct headerVie_Previews: PreviewProvider {
    static var previews: some View {
        headerView()
            .environmentObject(LoginViewModel())
            
    }
}*/

