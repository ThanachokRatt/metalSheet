//
//  CustomAlert.swift
//  metalSheet
//
//  Created by Schweppe on 18/10/2566 BE.
//

import SwiftUI
struct CustomAlertViewSuccess: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject  var addProductHistoryModel: AddProductViewModel
    @EnvironmentObject  var  orderViewModel: OrderViewModel
   

 

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25) {
                Image("removeBgLogo")
                    .resizable()
                    .frame(width: 160, height: 140)
         
                    .font(.system(size: 24))
                    .foregroundColor(.pink)
                Text("Save Order Successfully!")
                    .font(.system(size: 27))
                    .foregroundColor(.pink)
                Text("    We have received your order")
                Text("Please wait for our contact soon.")
                    
                Button(action: {
                    if orderViewModel.shouldDismiss{
                        addProductHistoryModel.removeAllItems()
                        presentationMode.wrappedValue.dismiss()
                        orderViewModel.setShowAlert2()
                        
                    }
                    
                }) {
                    Text("Back To Cart")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color("lipstick"))
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView())
            .cornerRadius(25)
        }
      
        
    }
}


struct CustomAlertViewFail: View {
    @Binding var isAlertFailVisible: Bool
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25) {
                Image("removeBgLogo")
                    .resizable()
                    .frame(width: 160, height: 140)
         
                    .font(.system(size: 24))
                    .foregroundColor(.pink)
                Text("Please Add Your Location!")
                    .font(.system(size: 27))
                    .foregroundColor(.pink)
                Button(action: {
                    isAlertFailVisible.toggle()
                    
                }) {
                    Text("Back To Order")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color("lipstick"))
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView())
            .cornerRadius(25)
        }
      
        
    }
}


struct BlurView : UIViewRepresentable{
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
