//
//  ProductsRequests.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation
import Combine
import SwiftUI

class ProductsRequests {
    
    static let shared = ProductsRequests()
    private let productsURL = "https://dummyjson.com/products"
    private var cancellables = Set<AnyCancellable>()
    
    func fetchAllProducts() -> AnyPublisher<[Product], Error> {
        
        if let savedProductsResponse = UserDefaultsManager.shared.fetchProductsResponse() {
            
            return Just(savedProductsResponse.products)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        guard let url = URL(string: productsURL) else {
            
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ProductsResponse.self, decoder: JSONDecoder())
            .handleEvents(receiveOutput: { productsResponse in
                
                UserDefaultsManager.shared.saveProductsResponse(productsResponse)
            })
            .map { $0.products }
            .eraseToAnyPublisher()
    }
    
    func loadImage(from imageUrl: String) -> AnyPublisher<UIImage?, Error> {
        guard let url = URL(string: imageUrl) else {
            
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}


enum NetworkError: Error {
    case invalidURL
    case noData
}
