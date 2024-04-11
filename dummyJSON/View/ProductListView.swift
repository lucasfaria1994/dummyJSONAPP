//
//  ProductListView.swift
//  dummyJSON
//
//  Created by Lucas Faria on 11/04/2024.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 5) {
                    ForEach(viewModel.products, id: \.id) { product in
                        NavigationLink(destination: ProductView(product: product)) {
                            ProductListItemView(product: product)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
