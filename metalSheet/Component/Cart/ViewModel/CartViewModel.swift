//
//  CartViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 9/9/2566 BE.
//

import Foundation

class CartViewModel: ObservableObject{
    @Published var cartModel: [CartModel] = []
    
    init() {
        cartModel.append(CartModel(productImage: "product1", productName: "ลอนสแน๊ปลอค", description: "เมทัลชีท ลอนสแน๊ปลอครูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 65, priceColor: 70, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
        
        cartModel.append(CartModel(productImage: "product2", productName: "ลอน 5 สัน", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 80, priceColor: 85, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
        
        cartModel.append(CartModel(productImage: "product3", productName: "ลอนฝาผนัง", description: "เมทัลชีท ลอนฝาผนังรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 80, priceColor: 85, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
        
        cartModel.append(CartModel(productImage: "product4", productName: "ลอนมาตรฐาน", description: "เมทัลชีท ลอนมาตรฐานรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 190, priceColor: 199, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
        
        cartModel.append(CartModel(productImage: "product5", productName: "ลอนระแนง", description: "เมทัลชีท ลอนระแนงรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 84, priceColor: 94, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
        
        cartModel.append(CartModel(productImage: "product6", productName: "ลอนรั้ว", description: "เมทัลชีท ลอนรั้วรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 90, priceColor: 99, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
        
        
        
    }
}



