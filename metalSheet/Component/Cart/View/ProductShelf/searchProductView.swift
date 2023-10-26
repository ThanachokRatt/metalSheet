//
//  searchProductView.swift
//  metalSheet
//
//  Created by Schweppe on 9/9/2566 BE.
//


import SwiftUI

struct searchProductView: View {
    
    @State private var searchText = ""
    @State private var isTyping = false
   
    
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    // Handle search here using the searchText
                    print("Search: \(searchText)")
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.black)
                        .padding(.trailing, 8)
                        
                }

              
                TextField("Search Product", text: $searchText)
                
            }.padding(.all,15)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10.0)
                .padding(.trailing)
            
               
            
        }.padding()
    }
}

struct searchProductView_Previews: PreviewProvider {
    static var previews: some View {
        searchProductView()
    }
}
