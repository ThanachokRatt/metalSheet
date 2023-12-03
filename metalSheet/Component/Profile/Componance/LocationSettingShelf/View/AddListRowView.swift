//
//  addLocationButtonView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct AddListRowView: View {
    @State private var isEditing = false
    var body: some View {
        NavigationLink(destination: addNewlocationView(isEditing: $isEditing)) {
             HStack {
                 Image(systemName: "plus.app")
                     .resizable()
                     .scaledToFit()
                     .foregroundColor(Color(.white))
                     .frame(width: 30,height: 40)
                 Text("เพิ่มที่อยู่ใหม่")
                     .padding()
                     
                    
                     .foregroundColor(.white)
                     .cornerRadius(10)
             }
             .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
             .frame(maxWidth: .infinity)
             .background(Color("lipstick"))
             .foregroundColor(.white)
             .cornerRadius(10) // Adjust horizontal padding
             
             
             .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
         }
         
    }
    
 }

/*struct addLocationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddListRowView()
    }
}*/
