//
//  backgroundHomeView.swift
//  metalSheet
//
//  Created by Schweppe on 30/8/2566 BE.
//

import SwiftUI

struct backgroundHomeView: View {
    var body: some View {
        GeometryReader{ geometry in
            Rectangle()
                .fill(Color("green123").opacity(0.8))
                .scaleEffect(2)
                .offset(y: -geometry.size.height*1.4)
        }
    }
}

struct backgroundHomeView_Previews: PreviewProvider {
    static var previews: some View {
        backgroundHomeView()
    }
}
