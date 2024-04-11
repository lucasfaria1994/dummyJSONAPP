//
//  AsyncImageView.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import SwiftUI

struct AsyncImageView: View {
    let imageUrl: String
    
    @State private var image: UIImage? = nil
    @State private var isLoading = false
    
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
            ProductsRequests.shared.loadImage(from: imageUrl) { loadedImage in
                self.image = loadedImage
                self.isLoading = false
            }
        }
    }
}

