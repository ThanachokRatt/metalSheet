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
                    Image(systemName: "basket")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                       
                    Text("เพิ่มลงตะกร้า")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                       
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 8)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("orange"), Color("red1"), Color("red1")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    .opacity(0.8)
                                )
                
                .shadow(radius: 3)
                .cornerRadius(30)
              
            })
         
            
        
         
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 18, trailing: 16))
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


