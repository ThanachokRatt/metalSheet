//
//  OrderHistoryRowView.swift
//  metalSheet
//
//  Created by Schweppe on 17/12/2566 BE.
//

import SwiftUI

struct OrderHistoryRowView: View {
    var viewmodel: OrderHistoryModel
    
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack {
            HStack{
                Text("หมาเลขคำสั่งซื้อ \(viewmodel.orderNumber)")
                   
                Text(viewmodel.orderStatus)
                    .font(Font.custom("Pridi-Regular",size: isiPad ? 23 : 14))
                    .foregroundColor(.blue)
                    .padding(.leading,1)
         Spacer()
            }.padding(.leading,15)
           
            // For loop for OrderDetailView
            ForEach(viewmodel.orderLists, id: \.self) { orderDetail in
                   OrderDetailView(viewmodel: orderDetail)
                        }
           /* HStack{
                Color("lipstick")
                    .frame(width: isiPad ? 990: 400,height: 3)
                Spacer()
            }.padding(.leading,15)*/
            
            HStack{
                Text("ราคาสินค้าทั้งหมด")
              
              
                Text(formatCurrency(viewmodel.sumTotal))
                    .padding(.leading,18)
                   
                
                Spacer()
            }
            .font(Font.custom("Pridi-Regular",size: isiPad ? 29 : 19))
 
            .padding(.leading,15)
            /*HStack{
                Color("lipstick")
                    .frame(width: isiPad ? 990: 400,height: 3)
                Spacer()
            }.padding(.leading,15)*/
            
        }.font(Font.custom("Pridi-Light",size: isiPad ? 27 : 17))
       
    }
    func formatCurrency(_ amount: String) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            if let number = formatter.number(from: amount) {
                return "\(formatter.string(from: number) ?? "").00 บาท"
            } else {
                return amount
            }
        }
}

/*#Preview {
    OrderHistoryRowView()
    
}*/
struct OrderDetailView: View {
    var viewmodel: orderDetailList
    
   
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        HStack{
            VStack( alignment: .leading,spacing: 0){
                Text(viewmodel.orderName )
                    .font(Font.custom("Pridi-Regular",size: isiPad ? 27 : 17))
                  
			
				
                HStack{
					if !viewmodel.lenght.isEmpty {
									   Text(viewmodel.lenght)
								   }
					if !viewmodel.bmt.isEmpty {
										Text(viewmodel.bmt)
											.padding(.leading, 15)
									}
                       
				}.padding(.horizontal,5)
                HStack{
					Text(viewmodel.color)
						
                    Text("จำนวน : \(viewmodel.qty)")
						.padding(.leading,35)
                    Text("ราคา : \(viewmodel.price)")
                        .padding(.leading,35)
                }
               
            }
            Spacer()
        }.padding(.leading,15)
	}
}

