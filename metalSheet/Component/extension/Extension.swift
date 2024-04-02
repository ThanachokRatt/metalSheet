//
//  Extension.swift
//  metalSheet
//
//  Created by Schweppe on 2/4/2567 BE.
//

import Foundation

extension Float{ // จัดให้มันมี , คันหลักพันหลักร้อยหลักหมื่น
	var format2: String{
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = NumberFormatter.Style.decimal
		numberFormatter.minimumFractionDigits = 2
		numberFormatter.maximumFractionDigits = 2
		
		return numberFormatter.string(for: self)!
	}
}

