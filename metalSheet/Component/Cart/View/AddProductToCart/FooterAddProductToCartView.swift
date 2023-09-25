//
//  AddtoCartView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI

struct FooterAddProductToCartView: View {
    @EnvironmentObject var addProductHistoryModel : AddProductViewModel

    var viewModel: CartModel
    
    @Binding var stepperLong: Int // Binding to stepperLong
    @Binding var stepperQty: Int
    
    var body: some View {
        HStack{
         
            Spacer()
            
            Button(action: {
            
                addProductHistoryModel.addToCart(product: viewModel)
                
                
                stepperLong = 1
                stepperQty = 1
            }, label: {
                VStack (spacing: 5){
                    Image(systemName: "basket.fill")
                        .foregroundColor(Color(.red).opacity(0.7))
                       
                    Text("เพิ่มสินค้าลงตะกร้า")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                     .stroke(Color(.black), lineWidth: 3)
                )
                .shadow(radius: 1)
                .cornerRadius(10)
            })
         
            
            Button(action: {
                print("but it now")
            }, label: {
                Text("ซื้อสินค้า")
                    
                    .font(.subheadline)
                                       .padding(.horizontal, 20)
                                       .padding(.vertical, 14)
                                       .background(Color.white)
                                       .cornerRadius(10)
                                       .foregroundColor(Color(.black))
                                       .overlay(
                                           RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(.black), lineWidth: 1.5)
                                       )
                                       .shadow(radius: 1)
            })
         
        }
        .padding(20)
        .padding(.horizontal)
        .background(Color("lipstick"))
        .cornerRadius(50, corners: .topLeft)
        .frame(maxHeight: .infinity, alignment:  .bottom)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


