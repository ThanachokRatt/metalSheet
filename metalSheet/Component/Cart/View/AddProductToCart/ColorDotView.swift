//
//  ColorDotView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//
// let ColorCategory = ["Black","White","Blue","Brown","Pink","Gray","Red","Yellow"]

import SwiftUI

struct ColorCategoryView: View {
    @Binding var selectedColor: String?
    let color: String
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
    var body: some View {
        ColorDotView(color: Color(color))
            .onTapGesture {
                selectedColor = color
                addProductHistoryModel.updateSelectedColorCategory(color)
             //   print("Selected Color: \(color)") // Print the selected color
            }
            
            .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color(selectedColor == color ? "lipstick" : "ดำเงา" ),lineWidth:  selectedColor == color ? 4 : 1))
           
    }
}

struct ColorDotView: View {
    let color: Color

    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        color
            .frame(width: isiPad ? 36: 28, height: isiPad ? 36: 28)
            .clipShape(Circle())
    }
}

struct ColorDotCategoryView: View {
    
    @State private var selectedColor: String?
    let colorCategories: [String]
    let isCategoryEnabled: Bool
  
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 8)
    
    init(colorCategories: [String], isCategoryEnabled: Bool) {
        self.colorCategories = colorCategories
        self.isCategoryEnabled = isCategoryEnabled
       
    }

    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad

         VStack(alignment: .leading) {
             Text("สี: \(isCategoryEnabled ? selectedColor ?? "อลูซิงค์" : "อลูซิงค์")")
                 .font(.system(size: isiPad ? 26 : 18))
                 .bold()

             LazyVGrid(columns: columns, spacing: 5) {
                 ForEach(colorCategories, id: \.self) { color in
                     ColorCategoryView(selectedColor: $selectedColor, color: color)
                         .disabled(!isCategoryEnabled)
                 }
                 
             }
            
         }
      
     }
 }



