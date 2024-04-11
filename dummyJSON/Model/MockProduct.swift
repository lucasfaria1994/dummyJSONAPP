//
//  MockProduct.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation

struct MockProduct {
    static let mock: Product = {
        return Product(
            id: 19,
            title: "Mock Product",
            description: "This is a mock product description.",
            price: 9.99,
            discountPercentage: 10.0,
            rating: 3,
            stock: 100,
            brand: "Mock Brand",
            category: "Mock Category",
            thumbnail: "https://cdn.dummyjson.com/product-images/19/thumbnail.jpg",
            images: ["https://cdn.dummyjson.com/product-images/19/thumbnail.jpg"]
        )
    }()
}
