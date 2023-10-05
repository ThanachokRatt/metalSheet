//
//  MapViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 31/8/2566 BE.
//

import Foundation
class MapViewModel: ObservableObject{
    @Published var mapModel: [MapModel] = []
    
    init(){
        mapModel.append(MapModel(mapImage: "lumluka",
                                 mapURL: "https://maps.app.goo.gl/rZeonHRWRo3KhR1E9?g_st=ic"))
        mapModel.append(MapModel(mapImage: "meanburi",
                                 mapURL: "https://maps.app.goo.gl/T6evyyhEMUMJCiV67?g_st=ic"))
        mapModel.append(MapModel(mapImage: "meanburi",
                                 mapURL: "https://maps.app.goo.gl/T6evyyhEMUMJCiV67?g_st=ic"))
    }
}
