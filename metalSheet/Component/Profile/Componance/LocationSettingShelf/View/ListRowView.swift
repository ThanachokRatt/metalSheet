//
//  ListRowView.swift
//  metalSheet
//
//  Created by Schweppe on 24/9/2566 BE.
//

import SwiftUI

struct ListRowView:View{
    let item: LocationItemModel
    @EnvironmentObject var locationViewModel: LocationViewModel
    @Binding var navigationtoLocationView: Bool
   
    
    
    var body : some View{
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack(alignment: .leading, spacing: 0) {
            HStack{
                
                Button(action: {
                    withAnimation(.linear) {
                    
                        locationViewModel.updateItem(item: item)
                        
                        
                    }
                }) {
                    Image(systemName: item.isSelected ? "checkmark.circle" : "circle")
                        .resizable()
                        .foregroundColor(item.isSelected ? .green : .red)
                        .frame(width: 30, height: 30)
                }
                
                VStack (spacing:5){
                    
                    HStack (spacing: 25) {
                        Text(item.name).bold()
							.foregroundColor(.black)
                        Text(item.phone)
                            .foregroundColor(Color.gray.opacity(0.8))
                        
                        Spacer()
                        
                    }.font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))
                    
                    HStack{
                        VStack (spacing: 5){
                            
                            Text(item.addressOne)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundColor(.black)
                            Text(item.adressTwo)
                                .frame(maxWidth: .infinity,alignment: .leading)
								.foregroundColor(.black)
                            HStack {
                                Text(item.postCode)
                                    .frame(maxWidth: .infinity,alignment: .leading)
									.foregroundColor(.black)
                                
                                Spacer()
                                
                                if navigationtoLocationView {
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width:isiPad ? 20 : 10,height:isiPad ? 25 : 15 )
                                        .foregroundColor(Color.gray.opacity(0.8))
                                        .padding(.top,-10)
                                } else {
                                    EmptyView()
                                }
                            }
                            Text(item.addressType)
								.foregroundColor(.black)
                                .padding(.all,4)
                                .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .stroke(Color.gray.opacity(0.8), lineWidth: 1))
                            
                                .frame(maxWidth: .infinity,alignment: .leading)
							
							if !item.locationLink.isEmpty {
								Text(item.locationLink)
									.frame(maxWidth: .infinity,alignment: .leading)
									.lineLimit(1)
									.foregroundColor(.blue)
							}
							
                            HStack{
                                Text(item.isSelected ? "(ค่าเริ่มต้น)" : " ")
                                
                                    .foregroundColor(.red)
                                Spacer()
                                Text(navigationtoLocationView ? "(กดเพื่อไปยังหน้าจัดการที่อยู่)" : "(กดเพื่อแก้ไขที่อยู่)")
									.font(Font.custom("Pridi-Light",size: isiPad ? 23 : 13))
                                
                                    .foregroundColor(Color.gray.opacity(0.8))
                                if navigationtoLocationView {
                                    Image(systemName: "house.fill")
                                    
                                        .resizable()
                                        .foregroundColor(.red)
                                        .scaledToFit()
                                        .frame(width:isiPad ? 32 : 22, height:isiPad ? 32 : 22)
                                        .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                                } else {
                                    Image(systemName: "house.fill")
                                    
                                        .resizable()
                                        .foregroundColor(.red)
                                        .scaledToFit()
                                        .frame(width:isiPad ? 32 : 22, height:isiPad ? 32 : 22)
                                        .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                                }
                                
                            }
                            
                        }.font(Font.custom("Pridi-Light",size: isiPad ? 25 : 15))
                        
                        
                        
                        
                    }
                    
                }
                .padding()
                
                /*Button(action: {
                 
                 }) {
                 Image(systemName: "trash")
                 .resizable()
                 .foregroundColor(.red).opacity(0.8)
                 .frame(width: 20,height: 20)
                 }*/
                
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
        }
        .padding(EdgeInsets(top: 0, leading: 7, bottom: 10, trailing: 7))
         
    }

}

