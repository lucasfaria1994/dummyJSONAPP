//
//  ProductView.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.cyan)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                .padding()
                .padding(.bottom, 30) // Add extra padding at the bottom to create a sense of 3D effect
            
            VStack(spacing: 20) {
                AsyncImageView(imageUrl: product.thumbnail)
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                    .padding(.top, 10)
                
                Text(product.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                
                Text("Price: €\(String(format: "%.2f", product.price))")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Discount: \(String(format: "%.1f", product.discountPercentage))%")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Text("Stock: \(product.stock)")
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Text("Rating: \(String(format: "%.1f", product.rating))")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    
                
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= Int(product.rating) ? "star.fill" : "star")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                    }
                }
    
                Spacer()
            }
            .padding()
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListItemView(product: MockProduct.mock)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
