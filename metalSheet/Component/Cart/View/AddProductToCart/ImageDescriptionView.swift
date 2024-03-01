//
//  ImageDescriptionView.swift
//  metalSheet
//
//  Created by Schweppe on 20/2/2567 BE.
//

import SwiftUI
import NukeUI

struct ImageDescriptionView: View {
	
	var viewModel : DescriptionViewModel
	
	var body: some View {
		let iPadHeight: CGFloat = 700
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		TabView {
			ForEach(viewModel.description) { infoModel in
				ForEach(infoModel.images, id: \.self) { imageUrl in
					LazyImage(source: imageUrl) { state in
						if let image = state.image{
							image
						}else{
							VStack{
								Image("removeTextLogo")
									.resizable()
									.aspectRatio(contentMode: .fit)
								Text("กำลังโหลด...")
									.foregroundColor(Color.black.opacity(0.7))
									.font(.subheadline)
							}
						}
					}
					.scaledToFit()
					.cornerRadius(20)
					.frame(width: UIScreen.main.bounds.width, height: isiPad ? iPadHeight : 400)
				
				  
				}
				.cornerRadius(20)
				.padding(.horizontal,5)
				//.padding(.horizontal,5)
				
			}

		}
		
		//.cornerRadius(20)
		
		
		.cornerRadius(20)
		
		.frame(width: UIScreen.main.bounds.width, height: isiPad ? iPadHeight : 400)

		.tabViewStyle(PageTabViewStyle())
		.padding(EdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12))
	
		
	}
}


