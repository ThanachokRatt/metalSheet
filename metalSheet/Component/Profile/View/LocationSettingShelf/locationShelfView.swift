//
//  locationView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

import SwiftUI

struct locationShelfView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel

    
    var body: some View {
        ZStack {
            VStack {
                headerLocationView().background(.white)
                List {
                    ForEach(locationViewModel.items) { index in
                        ListRowView(item: index).onTapGesture {
                            withAnimation(.linear){
                                locationViewModel.updateItem(item: index)
                            }
                        }
                            
                    }.onDelete(perform: locationViewModel.deleteItem)
                        .onMove(perform: locationViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                
                AddListRowView()
                Spacer()
            }
        }
    }

}


struct locationView_Previews: PreviewProvider {
    static var previews: some View {
        locationShelfView().environmentObject(LocationViewModel())
    }

}
