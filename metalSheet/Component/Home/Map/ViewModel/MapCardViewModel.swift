//
//  MapCardViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 5/9/2566 BE.
//

import Foundation
import SwiftUI

struct MapCardViewModel: Identifiable{
    var id = UUID()
    var image: String
    var title : String
    var url : String
}

var mapCardViewModel = [
MapCardViewModel(image: "lumluka", title: "สาขาลำลูกกา",url: "https://goo.gl/maps/MK7K3drtWHw3gsco6"),
MapCardViewModel(image: "meanburi", title: "สาขามีนบุรี",url: "https://goo.gl/maps/BoRAYxs3trQtgf5o6"),
MapCardViewModel(image: "ลาดกระบัง", title: "สาขาลาดกระบัง",url: "https://goo.gl/maps/y2AznroHAuuwHQGV8")
]
