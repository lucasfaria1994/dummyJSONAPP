//
//  ProductsResponse.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation

struct ProductsResponse: Codable {
    
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
