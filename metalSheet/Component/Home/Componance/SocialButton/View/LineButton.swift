//
//  LineButton.swift
//  metalSheet
//
//  Created by Schweppe on 21/10/2566 BE.
//

import SwiftUI

struct LineButton: View {
    let urlLine: String = "https://line.me/ti/p/gxyce5rV3r"
    var body: some View {
        let iPadWidth: CGFloat = 50
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            Link(destination: URL(string: urlLine)!,
                 label: {
                Image("lineButtonImage2")
                
                    .resizable()
                    .scaledToFit()
                    .frame(width: isiPad ? iPadWidth : 35)
                    .shadow(radius: 4)
                    
                   
                    
                  
            })
         
    }
}

/*struct LineButton_Previews: PreviewProvider {
    static var previews: some View {
        LineButton()
    }
}*/
/*Link(destination: URL(string: urlLine)!,
     label: {
    Image("lineButtonImage")
    
        .resizable()
        .scaledToFit()
        .frame(width: 150)
    
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("green123"),lineWidth:  1))
        .shadow(radius: 5)
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal,20)
})*/
