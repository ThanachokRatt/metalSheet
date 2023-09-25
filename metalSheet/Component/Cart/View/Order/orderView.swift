//
//  orderView.swift
//  metalSheet
//
//  Created by Schweppe on 25/9/2566 BE.
//

import SwiftUI

struct orderView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                
                if locationViewModel.items.contains(where: { $0.isSelected }) {
                    ForEach(locationViewModel.items.filter { $0.isSelected }) { selectedLocation in
                        NavigationLink(destination: locationShelfView()) {
                            ListRowView(item: selectedLocation)
                        }
                    }
                } else {
                    NavigationLink(destination: addNewlocationView()) {
                        HStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color(.black))
                                .frame(width: 20,height: 40)
                            Text("เพิ่มที่อยู่ใหม่")
                                .padding()
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .frame(maxWidth: .infinity)
                        .background(Color(.white))
                        .foregroundColor(.white)
                        .cornerRadius(20) // Adjust horizontal padding
                        
                        .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
                        .padding()
                    }
                }
            }
            .navigationTitle(Text("สั่งซื้อ"))
        }
    }
    
    struct orderView_Previews: PreviewProvider {
        static var previews: some View {
            orderView().environmentObject(LocationViewModel())
        }
    }
}
