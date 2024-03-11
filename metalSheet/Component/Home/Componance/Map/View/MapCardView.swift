//
//  MapCard.swift
//  metalSheet
//
//  Created by Schweppe on 5/9/2566 BE.
//


import SwiftUI
import NukeUI

struct MapCardView: View {
	var viewmodel: MapCardModel// Use ObservedObject to observe changes
	
	var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		
		VStack(alignment: .leading, spacing: 15) {
			Link(destination: URL(string: viewmodel.url)!, label: {
				LazyImage(source: viewmodel.image) { state in
					if let image = state.image {
						image
							.resizingMode(.aspectFit)
					} else {
						ZStack {
							
							Image("loadingMap")
								
								.resizable()
								.scaledToFit()
								.cornerRadius(15)
								
							ProgressView()
						}
					}
				}
				.overlay(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(Color.black, lineWidth: 2))
				
				.frame(width: isiPad ? UIScreen.main.bounds.width / 1.3 - 15 : UIScreen.main.bounds.width - 15, height: isiPad ? 200 : 120)
				.cornerRadius(15)
				
			})
			.padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
			
			
			
		}
	}
}
/*#Preview {
	MapCardView(viewmodel: MapCardModel(image: "https://res.cloudinary.com/dgfkdk5nu/image/upload/v1708500673/Map%E0%B8%A1%E0%B8%B5%E0%B8%99%E0%B8%9A%E0%B8%B8%E0%B8%A3%E0%B8%B5%E0%B9%81%E0%B8%81%E0%B9%89.png", title: "123", url: "123"))
}*/
