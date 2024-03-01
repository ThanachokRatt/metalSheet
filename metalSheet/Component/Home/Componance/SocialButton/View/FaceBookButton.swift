//
//  FaceBookButton.swift
//  metalSheet
//
//  Created by Schweppe on 17/12/2566 BE.
//

import SwiftUI

struct FaceBookButton: View {
    let urlFacebook: String = "https://www.facebook.com/profile.php?id=100087169930140"
    var body: some View {
        let iPadWidth: CGFloat = 50
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            Link(destination: URL(string: urlFacebook)!,
                 label: {
                Image("facebookImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isiPad ? iPadWidth : 35)
                    .shadow(radius: 4)
        
            })
         
    }
}

/*#Preview {
    FaceBookButton()
}*/
