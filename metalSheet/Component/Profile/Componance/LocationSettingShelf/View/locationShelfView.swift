//
//  locationView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//



import SwiftUI

struct locationShelfView: View {
   
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State private var navigationToLocationView : Bool = false
    @State private var selectedLocationItem: LocationItemModel? = nil
    @State private var isEditing = false
    
    
    var body: some View {
        ZStack {
            VStack {
                headerLocationView().background(.white)
                List {
                                   ForEach(locationViewModel.items) { index in
                                       Button(action: {
                                           withAnimation(.linear) {
                                               
                                             
                                               selectedLocationItem = index
                                               isEditing.toggle()
                                           }
                                       }) {
                                           ListRowView(item: index, navigationtoLocationView: .constant(false))
                                       }
                                       .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                           .stroke(Color.black, lineWidth:  1)
                                           .padding(EdgeInsets(top: 15, leading: -10, bottom: 15, trailing: -10))
                                       )
                                   }.onDelete(perform: locationViewModel.deleteItem)
                        .onMove(perform: locationViewModel.moveItem)
                        
                }
                .listStyle(PlainListStyle())
                
                
                AddListRowView()
                Spacer()
            }
        }
        .background(
             NavigationLink(destination: addNewlocationView(locationItem: selectedLocationItem, isEditing: $isEditing), isActive: $isEditing) {
                 EmptyView()
             }
             .hidden()
         )
         .navigationBarItems(trailing: EditButton())
     }
 }
