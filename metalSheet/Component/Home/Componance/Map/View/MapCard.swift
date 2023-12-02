//
//  MapCard.swift
//  metalSheet
//
//  Created by Schweppe on 5/9/2566 BE.
//

import SwiftUI

struct MapCard: View {
    var mapCard: MapCardViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Link(destination: URL(string: mapCard.url)!,
            label: {
                Image(mapCard.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
                    
                    
            })
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }.shadow(radius: 2)
   
    }
}

struct MapCard_Previews: PreviewProvider {
    static var previews: some View {
        MapCard(mapCard: mapCardViewModel[0])
    }
}
