//
//  infoImageView2.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
//
import SwiftUI
import NukeUI
struct infoImageView2: View {
    
    let infoData: [InfoDataModel]
    
    var body: some View {
        TabView {
            ForEach(infoData, id: \.id) { infoModel in
                ForEach(infoModel.img_src, id: \.self) { imageUrl in
                    LazyImage(source: imageUrl) { state in
                        if let image = state.image{
                            image
                   
                            
                            
                            
                        }else{
                            VStack{
                                Image("removeTextLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("กำลังโหลด...")
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .font(.subheadline)
                            }
                        }
                        
                        
                    }
                    
             
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: .infinity, height: 400)
                  
                }
                .cornerRadius(20)
                .padding(.horizontal,5)
                
            }
            
            
            
        }
        
        .cornerRadius(20)
        .frame(width: .infinity, height: 400)
        .tabViewStyle(PageTabViewStyle())
        .padding(EdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12))
        
    }
}
 /*   import SwiftUI
     struct infoImageView2: View {
     let infoData: [InfoDataModel]
     
     var body: some View {
     TabView {
     ForEach(infoData, id: \.id) { infoModel in
     ForEach(infoModel.img_src, id: \.self) { imageUrl in
     AsyncImage(url: URL(string: imageUrl)) { phase in
     switch phase {
     case .empty:
     LoadingView()
     case .success(let image):
     image
     .resizable()
     .frame(width: .infinity, height: 380)
     .cornerRadius(15.0)
     .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color.black, lineWidth: 0))
     case .failure:
     Image(systemName: "photo")
     @unknown default:
     EmptyView()
     }
     }
     .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
     }
     }
     }
     .cornerRadius(20)
     .frame(width: .infinity, height: 380)
     .tabViewStyle(PageTabViewStyle())
     }
     
     struct LoadingView: View {
     
     
     var body: some View {
     VStack{
     Image("removeBgLogo")
     .resizable()
     .aspectRatio(contentMode: .fit)
     Text("Loading...")
     .foregroundColor(Color.black.opacity(0.5))
     .font(.subheadline)
     
     }
     }
     }
     
     }
     
}
*/
