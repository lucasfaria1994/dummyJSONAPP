//
//  ProductViewModel.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    init() {
        
        self.fetchProducts()
    }
    
    private func fetchProducts() {
        
        ProductsRequests.shared.fetchAllproducts { result in
            
            switch result {
                
            case .success(let products):
                
                DispatchQueue.main.async {
                    self.products = products
                }
                
            case .failure(_):
                self.products = [MockProduct.mock]
            }
        }
    }
}
