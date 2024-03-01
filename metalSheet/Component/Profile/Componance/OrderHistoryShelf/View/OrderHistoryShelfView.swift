//
//  OrderHistoryShelfView.swift
//  metalSheet
//
//  Created by Schweppe on 17/12/2566 BE.
//

import SwiftUI

struct OrderHistoryShelfView: View {
    @EnvironmentObject var viewModel: OrderHistoryViewModel
    
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        ScrollView{
            if viewModel.orderHistoryModel.isEmpty{
                headerOrderHistoryView()
                Text("ไม่มีประวัติคำสั่งซื้อ")
                    .foregroundColor(.black.opacity(0.6))
                    .bold()
                    .font(Font.custom("Pridi-Light",size: isiPad ? 37 : 27))
            }else{
                headerOrderHistoryView()
                ForEach(viewModel.orderHistoryModel, id: \.self){ orderHistoryModel in OrderHistoryRowView(viewmodel: orderHistoryModel)}
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.black, lineWidth:  1)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                )
                
            }
        }
        
  
    }
}

/*#Preview {
    OrderHistoryShelfView()
}*/
