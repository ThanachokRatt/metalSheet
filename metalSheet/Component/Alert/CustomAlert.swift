//
//  CustomAlert.swift
//  metalSheet
//
//  Created by Schweppe on 18/10/2566 BE.
//

import SwiftUI

struct BlurView : UIViewRepresentable{
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
