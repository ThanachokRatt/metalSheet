//
//  forloopProductView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct ProductCartView: View {
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
    @StateObject var viewModel: CartViewModel = CartViewModel()
   
    let itemsPerRow = 2 // จำนวนรายการต่อแถว
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    searchProductView()
                    buttonCartView(numberOfProduct: addProductHistoryModel.items.count)
                        .padding(.trailing,35)
                    
                    
                }
                
                ScrollView {
                    Text("รายการสินค้า")
                        .foregroundColor(.black).opacity(0.6)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(15)
                  
                    LazyVStack(alignment: .center, spacing: 20) {
                        ForEach(0..<viewModel.cartModel.count, id: \.self) { index in
                            if index % itemsPerRow == 0 {
                                LazyHStack(spacing: 20) {
                                    ForEach(index..<min(index + itemsPerRow, viewModel.cartModel.count), id: \.self) { subIndex in
                                        productView(for: subIndex)
                                    }
                                }
                            }
                        }
                        
                    }
                    .safeAreaInset(edge: .bottom) {
                        Color.clear.frame(height: 120)
                    }
                    .ignoresSafeArea()
                    .background(Color(.white).opacity(0.2))
                }
            }
        }
        
    }
    
    @ViewBuilder
    func productView(for index: Int) -> some View {
        NavigationLink(destination: {
            DescriptionView( viewModel: CartModel(productImage: viewModel.cartModel[index].productImage, productName: viewModel.cartModel[index].productName, description: viewModel.cartModel[index].description, categories: viewModel.cartModel[index].categories, priceNocolor: viewModel.cartModel[index].priceNocolor, priceColor: viewModel.cartModel[index].priceColor, colorCategories: viewModel.cartModel[index].colorCategories,currentPrice: viewModel.cartModel[index].currentPrice,selectedCategory: viewModel.cartModel[index].selectedCategory,selectedColorCategory: viewModel.cartModel[index].selectedColorCategory,selectedLong: viewModel.cartModel[index].selectedLong,selectedQty: viewModel.cartModel[index].selectedQty))
                .environmentObject(addProductHistoryModel)
        }) {
            
            productSingleView( viewmodel: CartModel(productImage: viewModel.cartModel[index].productImage, productName: viewModel.cartModel[index].productName, description: viewModel.cartModel[index].description, categories: viewModel.cartModel[index].categories, priceNocolor: viewModel.cartModel[index].priceNocolor, priceColor: viewModel.cartModel[index].priceColor, colorCategories: viewModel.cartModel[index].colorCategories,currentPrice: viewModel.cartModel[index].currentPrice,selectedCategory: viewModel.cartModel[index].selectedCategory,selectedColorCategory: viewModel.cartModel[index].selectedColorCategory,selectedLong: viewModel.cartModel[index].selectedLong,selectedQty: viewModel.cartModel[index].selectedQty))
                .environmentObject(addProductHistoryModel)
                .frame(maxWidth: .infinity)
            
        }
    }
}

struct forloopProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCartView()
            .environmentObject(AddProductViewModel())
    }
}

/*import SwiftUI

struct forloopProductView: View {
    @StateObject var viewModel: CartViewModel = CartViewModel()
    @State private var selectedProductIndex: Int? = nil
    @State private var isDescriptionViewPresented = false

    let itemsPerRow = 2

    var body: some View {
        VStack {
            ScrollView {
                Text("รายการสินค้า")
                    .foregroundColor(.black).opacity(0.6)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(15)

                LazyVStack(alignment: .center, spacing: 20) {
                    ForEach(0..<viewModel.cartModel.count, id: \.self) { index in
                        if index % itemsPerRow == 0 {
                            LazyHStack(spacing: 20) {
                                ForEach(index..<min(index + itemsPerRow, viewModel.cartModel.count), id: \.self) { subIndex in
                                    productView(for: subIndex)
                                }
                            }
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 120)
                }
                .ignoresSafeArea()
                .background(Color(.white).opacity(0.2))
            }
        }
        .fullScreenCover(isPresented: $isDescriptionViewPresented) {
            if isDescriptionViewPresented, let index = selectedProductIndex {
                DescriptionView(viewModel: CartModel(
                    productImage: viewModel.cartModel[index].productImage,
                    productName: viewModel.cartModel[index].productName,
                    description: viewModel.cartModel[index].description,
                    categories: viewModel.cartModel[index].categories,
                    priceNocolor: viewModel.cartModel[index].priceNocolor,
                    priceColor: viewModel.cartModel[index].priceColor,
                    colorCategories: viewModel.cartModel[index].colorCategories)
                )
            }
        }
        .onChange(of: isDescriptionViewPresented) { newValue in
            if newValue, let index = selectedProductIndex {
                isDescriptionViewPresented = false
                DispatchQueue.main.async {
                    isDescriptionViewPresented = true
                }
            }
        }
        .onChange(of: selectedProductIndex) { newValue in
            if isDescriptionViewPresented, newValue == nil {
                isDescriptionViewPresented = false
            }
        }
    }

    @ViewBuilder
    func productView(for index: Int) -> some View {
        Button(action: {
            selectedProductIndex = index
            isDescriptionViewPresented = true
        }) {
            productSingleView(productImage: viewModel.cartModel[index].productImage, productName: viewModel.cartModel[index].productName)
                .frame(maxWidth: .infinity)
        }
    }
}


struct forloopProductView_Previews: PreviewProvider {
    static var previews: some View {
        forloopProductView()
    }
}*/
