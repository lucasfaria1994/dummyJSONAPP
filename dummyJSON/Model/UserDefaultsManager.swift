//
//  UserDefaultsManager.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let keyProductsResponse = "productsResponse"
    
    func saveProductsResponse(_ productsResponse: ProductsResponse) {
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(productsResponse) {
            
            UserDefaults.standard.set(encoded, forKey: keyProductsResponse)
        }
    }
    
    func fetchProductsResponse() -> ProductsResponse? {
        
        if let savedData = UserDefaults.standard.data(forKey: keyProductsResponse) {
            
            let decoder = JSONDecoder()
            if let loadedProductsResponse = try? decoder.decode(ProductsResponse.self, from: savedData) {
                
                return loadedProductsResponse
            }
        }
        return nil
    }
}
