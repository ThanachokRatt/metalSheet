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
                print("Selected Color: \(color)") // Print the selected color
            }
            .opacity(selectedColor == color ? 1 : 0.4)
    }
}

struct ColorDotView: View {
    let color: Color

    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct ColorDotCategoryView: View {
    
    @State private var selectedColor: String?
    let colorCategories: [String]
    let isCategoryEnabled: Bool
  
    init(colorCategories: [String], isCategoryEnabled: Bool) {
        self.colorCategories = colorCategories
        self.isCategoryEnabled = isCategoryEnabled
       
    }

    var body: some View {
        VStack (alignment: .leading) {
            Text("สี: \(isCategoryEnabled ? selectedColor ?? "อลูซิงค์" : "อลูซิงค์")")
                .fontWeight(.semibold)
              
            HStack {
                ForEach(colorCategories, id: \.self) { color in
                    
                    ColorCategoryView(selectedColor: $selectedColor, color: color)
                        .disabled(!isCategoryEnabled)
                    
                } .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
            }
        }
    }
}


