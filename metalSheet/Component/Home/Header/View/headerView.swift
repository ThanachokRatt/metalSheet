//
//  backgroundOfHomePageView.swift
//  metalSheet
//
//  Created by Schweppe on 27/8/2566 BE.
//

import SwiftUI

struct headerView: View {
    var name : String
    var body: some View {
       
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30 , height: 30)
                            .padding(EdgeInsets(top: 0, leading: 35, bottom: 20, trailing: 0))
                        Text(name)
                            .font(.headline).bold()
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 6, trailing: 0))
                        Spacer()
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .foregroundColor(Color.white).background(Color("green123").opacity(0.7)
            .frame(width: .infinity)
            .ignoresSafeArea())
        }
    }


struct backgroundOfHomePageView_Previews: PreviewProvider {
    static var previews: some View {
        headerView(name: "Webkung054")
    }
}
