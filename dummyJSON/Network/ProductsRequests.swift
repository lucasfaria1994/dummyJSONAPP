//
//  ProductsRequests.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation
import Combine
import SwiftUI

class ProductsRequests{
    
    static let shared = ProductsRequests()
    private let productsURL = "https://dummyjson.com/products"
    private var cancellables = Set<AnyCancellable>()
    
    public func fetchAllproducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        if let savedProductsResponse = UserDefaultsManager.shared.fetchProductsResponse() {
            
            completion(.success(savedProductsResponse.products))
            return
        }
        
        guard let url = URL(string: productsURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                
                let productsResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
                UserDefaultsManager.shared.saveProductsResponse(productsResponse)
                completion(.success(productsResponse.products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func loadImage(from imageUrl: String, 
                   completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: imageUrl) else { return completion(nil) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data, let loadedImage = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    completion(loadedImage)
                }
            } else {
                
                completion(nil)
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
