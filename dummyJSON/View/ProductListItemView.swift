//
//  ProductListItemView.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation
import SwiftUI

struct ProductListItemView: View {
    let product: Product
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.cyan)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 5)
                .padding(.bottom, 5)
            
            HStack {
                AsyncImageView(imageUrl: product.thumbnail)
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                    .padding(.top, 0)
                
                VStack(alignment: .leading) {
                    Text(product.title)
                        .font(.title3)
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
                }.padding()
                
                Spacer()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

struct ProductListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListItemView(product: MockProduct.mock)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}

