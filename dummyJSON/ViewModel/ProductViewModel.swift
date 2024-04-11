//
//  ProductViewModel.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        fetchProducts()
    }
    
    private func fetchProducts() {
        
        ProductsRequests.shared.fetchAllProducts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .failure:
                    self.products = [MockProduct.mock]
                case .finished:
                    break
                }
            }, receiveValue: { products in
                
                self.products = products
            })
            .store(in: &cancellables)
    }
}
