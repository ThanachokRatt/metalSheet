//
//  headerAndSumView.swift
//  metalSheet
//
//  Created by Schweppe on 7/9/2566 BE.
//

import SwiftUI

struct headerAndSumView: View {
    let sum: String = "150,000.00"
    var body: some View {
        VStack {
      
            
                Text("ข้อมูลส่วนตัว")
                    .foregroundColor(.black).opacity(0.8)
                    .font(.system(size:35))
                    .fontWeight(.bold)
                   
                    .frame(maxWidth: .infinity,alignment: .leading)
                .padding(20)
            
            VStack {
                RoundedRectangle(cornerRadius:25.0)
                    
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 300,height: 125)
                    .padding()
                    .overlay {
                        VStack{
                            VStack {
                                Text("ยอดรวมการสั่งซื้อ")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            HStack{
                                Text("฿")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(sum).foregroundColor(Color(.red))
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                        }
                        
                }
            }
        }
    }
}

struct headerAndSumView_Previews: PreviewProvider {
    static var previews: some View {
        headerAndSumView()
    }
}
