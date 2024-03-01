//
//  headerOrderHistoryView.swift
//  metalSheet
//
//  Created by Schweppe on 18/12/2566 BE.
//

import SwiftUI

struct headerOrderHistoryView: View {
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack (spacing: 35){
            Image("orderLogo")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 80,height: 80)
            
            Text("ประวัติคำสั่งซื้อ")
                .foregroundColor(.black)
                .font(Font.custom("Pridi-Regular",size: isiPad ? 40 : 30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 15)
        
        }.padding(EdgeInsets(top: 30, leading: 5, bottom: 25, trailing: 5))
           
    }
}

//#Preview {
//    headerOrderHistoryView()
//}

