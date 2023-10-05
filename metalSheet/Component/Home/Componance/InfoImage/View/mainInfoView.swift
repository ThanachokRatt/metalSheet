//
//  mainInfoView.swift
//  metalSheet
//
//  Created by Schweppe on 30/8/2566 BE.
//

import SwiftUI

struct mainInfoView: View {
    let infoImage: [InfoImage]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(infoImage) { info in
                    infoView(infoimage: info)
                }
            }.padding()
        }
    }
}

struct mainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        mainInfoView(infoImage: [.init(infoImage: "Image1"),
                                 .init(infoImage: "Image2"),
                                 .init(infoImage: "Image3"),
                                 .init(infoImage: "Image4")])
    }
}
