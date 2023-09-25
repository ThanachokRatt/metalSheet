//
//  customTapBarView.swift
//  metalSheet
//
//  Created by Schweppe on 30/8/2566 BE.
//

import SwiftUI

public enum Tab: String, CaseIterable{
    case house
    case cart
    case person
}

struct customTapBarView: View {
    @Binding var selectedTap: Tab
    private var fillImage: String{
        selectedTap.rawValue + ".fill"
        
    }
    private var tabColor: Color{
        switch selectedTap {
        case .house:
            return .black
        case .cart:
            return .orange
        case .person:
            return .indigo
        }
    }
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases,id: \.rawValue){ tab in
                    Spacer()
                    Image(systemName: selectedTap == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTap == tab  ? 1.5 : 1.25)
                        .font(.system(size: 22))
                        .foregroundColor(selectedTap == tab ? tabColor : .white)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTap = tab
                            }
                        }
                    Spacer()
                }
            }
        }
        .frame(width: nil, height: 80)
        .background(Color("green123"))
        
    }
}

struct customTapBarView_Previews: PreviewProvider {
    static var previews: some View {
        customTapBarView(selectedTap: .constant(.house))
    }
}
