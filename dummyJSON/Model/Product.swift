//
//  Product.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation

struct Product: Codable {
    
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
