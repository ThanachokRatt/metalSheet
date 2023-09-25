//
//  tabBarView3.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
//

import SwiftUI


struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 90){
                ForEach(tabItems) { item in
                    TabBarButton(item: item, isSelected: selectedTab == item.tab) {
                        selectedTab = item.tab
                    
                    }
                    
                }
             
            }
            
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
            .background(Color("green123")).opacity(0.8)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color("green123").opacity(0.5), radius: 20, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomLeading))
            )
            
        }.padding(.bottom,-10)
    }
}

struct tabBarView3_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct TabBarButton: View {
    var item: TabItem
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: item.icon)
                .resizable()
                .frame(width: 23,height: 23)
                .foregroundColor(Color.white)
               
                
                .opacity(isSelected ? 1 : 0.5)
                .background(
                    VStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.red).opacity(0.9)
                            .frame(width: isSelected ? 25 : 0, height: 5)
                            .offset(y: -9)
                            .opacity(isSelected ? 1 : 0)
                        Spacer()
                    }
                )
        }
    }
}
/*import SwiftUI
import RiveRuntime

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    let icon = RiveViewModel(fileName: "iconss", stateMachineName: "HOME_interactivity",artboardName: "HOME")
    var body: some View {
        VStack {
            Spacer()
            HStack{
                content
                
            }
            .padding(10)
            .background(Color("green123")).opacity(0.8)
            .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 24,style: .continuous))
        .shadow(color: Color("green123").opacity(0.5), radius: 20, x:0, y:2)
        .overlay(
            RoundedRectangle(cornerRadius:24, style:
                    .continuous)
            .stroke(.linearGradient(colors:
                                        [.white.opacity(0.5), .white.opacity(0)],
                                        startPoint: .topLeading, endPoint: .bottomLeading))
        )
        .padding(.horizontal,24)
        }
    }
    
    var content: some View{
        ForEach(tabItems) { item in
            Button {
                try? item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    try? item.icon.setInput("active", value: false)
                }
                withAnimation{
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 45)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack{
                        RoundedRectangle(cornerRadius: 2)
                                .fill(.red).opacity(0.9)
                                .frame(width: selectedTab == item.tab ? 30 : 0 ,height: 4)
                                .offset(y:-4)
                                .opacity(selectedTab == item.tab ? 1 : 0)
                            Spacer()
                        }
                        )
              
                        }
        }
    }
}
*/
