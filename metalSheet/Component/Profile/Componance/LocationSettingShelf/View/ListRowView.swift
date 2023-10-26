//
//  ListRowView.swift
//  metalSheet
//
//  Created by Schweppe on 24/9/2566 BE.
//

import SwiftUI

struct ListRowView:View{
    let item: LocationItemModel
 
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0) {
                HStack{
                    
                    Image(systemName: item.isSelected ? "checkmark.circle" : "circle")
                        .resizable()
                        .foregroundColor(item.isSelected ? .green : .red)
                        .frame(width: 30,height: 30)
                    
                    VStack (spacing:5){
                        
                        HStack (spacing: 25) {
                            Text(item.name).bold()
                            Text(item.phone)
                                .foregroundColor(Color.gray.opacity(0.8))
                            
                            Spacer()
                            
                        }.font(.system(size: 15))
                        
                        HStack{
                            VStack (spacing: 5){
                                
                                Text(item.addressOne)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text(item.adressTwo)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                HStack {
                                    Text(item.postCode)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                 /*   Spacer()
                                    Image(systemName: item.isSelected ? "chevron.forward.circle" : "")
                                        .resizable()
                                        .frame(width: 20,height: 20)*/
                                }
                                Text(item.addressType)
                                    .padding(.all,4)
                                    .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .stroke(Color.gray.opacity(0.8), lineWidth: 1))
                                 
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text(item.isSelected ? "(ค่าเริ่มต้น)" : "")
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.red)
                                
                            }.font(.system(size: 12))
                            
                            
                           
                            
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
                .overlay(RoundedRectangle(cornerRadius: 10,style: .continuous).stroke(Color.black,lineWidth:  1))
        }
        .padding(EdgeInsets(top: 0, leading: 7, bottom: 10, trailing: 7))
        
        
        
    }
}
struct ListRowView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ListRowView(item: LocationItemModel(name: "ธนโชค รัตนโมรา", phone: "0809095399", addressOne: "92/362", adressTwo: "หมู่บ้านชัยพฤกษ์ คลอง4 จ.ปทุมธานี", postCode: "12130", addressType: "บ้าน",isSelected: true)
        )
    }

}

