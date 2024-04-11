//
//  AsyncImageView.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import SwiftUI
import Combine

struct AsyncImageView: View {
    let imageUrl: String

    @State private var image: UIImage? = nil
    @State private var isLoading = false
    @State private var cancellable: AnyCancellable?

    var body: some View {
        Group {
            if isLoading {
                
                ProgressView()
            } else if let image = image {
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .onAppear {
            
            isLoading = true
            cancellable = ProductsRequests.shared.loadImage(from: imageUrl)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    
                    switch completion {
                    case .finished:
                        
                        isLoading = false
                    case .failure(_):
                        
                        isLoading = false
                    }
                }, receiveValue: { loadedImage in
                    
                    self.image = loadedImage
                })
        }
        .onDisappear {
            
            cancellable?.cancel()
        }
    }
}
