//
//  homePageView.swift
//  metalSheet
//
//  Created by Schweppe on 27/8/2566 BE.
//

import SwiftUI

struct homeShelfView: View {
    @StateObject var homeViewModel = HomeViewModel()
	@StateObject var mapCardViewModel = MapCardViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
					headerView()//.frame(height: 50)
                 
                    ScrollView(.vertical, showsIndicators: false) {
                        if !homeViewModel.homeModel.isEmpty {
                            infoImageView2(infoData: homeViewModel.homeModel)
                                .padding(EdgeInsets(top: 15, leading: 0, bottom: 7, trailing: 0))
                    
                            homeCaptionView(infoData: homeViewModel.homeModel)
							LazyVStack(spacing: 10){
								ForEach(0..<mapCardViewModel.mapCardModel.count, id: \.self){
									index in
									MapCardView(viewmodel: mapCardViewModel.mapCardModel[index])
								}
								
							}
							.padding(.top,10)
                        }else{

                                ProgressView()
                                .padding(.top,10)
                            Text("กำลังโหลด...")
                                .font(.subheadline)
                                .foregroundColor(Color.black.opacity(0.5))
                        }
                        
                        
					}
                    .safeAreaInset(edge: .bottom) {
                        Color.clear.frame(height: 120)
					}
                    .ignoresSafeArea()
					.refreshable {
						homeViewModel.refreshData()
						mapCardViewModel.refreshData()
					}
                }
                .background(Color.white)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

/*struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homeShelfView()
            .environmentObject(LoginViewModel())
    }
}*/

struct homeCaptionView: View {
    let infoData: [InfoDataModel]
    let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        if let firstInfoData = infoData.first {
            Text(" \(firstInfoData.descriptionHome)")
                .padding()
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .font(Font.custom("Pridi-Light",size: isiPad ? 25 : 16))
				.frame(width: isiPad ? UIScreen.main.bounds.width / 1.3 - 5 : UIScreen.main.bounds.width - 5 )
               
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color.black, lineWidth: 1)
                        .padding(5)
                        .shadow(radius: 2)
                )
             
                .padding(EdgeInsets(top: 0, leading: 15, bottom: -10, trailing:15))
                
        }
    }
}
