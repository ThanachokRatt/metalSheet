//
//  homePageView.swift
//  metalSheet
//
//  Created by Schweppe on 27/8/2566 BE.
//

import SwiftUI

struct homeShelfView: View {
    let caption : String = "    ทรัพย์ราชันหลังคาเมทัลชีทดูแลลูกค้าแบบครบวงจรตั้งแต่เริ่มวัดโครงสร้าง หาช่าง ผลิต จัดส่ง สินค้าคุณภาพแบบครบวงจรในราคาโรงงาน"
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    let userName : String = "Webkung054"
    var body: some View {
        
        NavigationView{
         
                ZStack {
                    VStack (spacing:0){
                        headerView().frame(height: 30)
                            ScrollView (.vertical,showsIndicators: false){
                                infoImageView2()
                                    .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                                Text(caption)
                                    .padding()
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    .font(.subheadline).bold()
                                
                                VStack (spacing: 20) {
                                    ForEach(mapCardViewModel) { i in
                                        MapCard(mapCard: i)
                                    }
                                }.padding()
                            }.safeAreaInset(edge: .bottom) {
                                Color.clear.frame(height: 120)
                            }
                            .ignoresSafeArea()
                            
                            
                        }
                      
                
            } .onAppear {
                print("Name in homeShelfView: \(loginViewModel.name)")
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homeShelfView()
            .environmentObject(LoginViewModel())
    }
}
