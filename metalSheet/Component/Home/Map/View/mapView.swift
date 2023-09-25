//
//  mapView.swift
//  metalSheet
//
//  Created by Schweppe on 31/8/2566 BE.
//

import SwiftUI

struct mapView: View {
    @StateObject var mapViewModel: MapViewModel = MapViewModel()
    
    var body: some View {
       
            List(self.mapViewModel.mapModel){
                item in
                mapItemView(imageName: item.mapImage, imageURL: item.mapURL)
            }
            .listStyle(PlainListStyle())
        
            
        
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}
