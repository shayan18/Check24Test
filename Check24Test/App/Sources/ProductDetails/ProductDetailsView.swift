//
//  ProductDetailsView.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture
import SwiftUI

struct ProductDetailsView: View {
  let store: Store<ProductListState, ProductListAction>

  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        VStack(alignment: .leading, spacing: 5) {
          Text(viewStore.state.productHeader?.headerTitle ?? "")
            .bold()
          Text(viewStore.state.productHeader?.headerDescription ?? "")
            .foregroundColor(.gray)
          ScrollView(.vertical) {
            ForEach(viewStore.products, id: \.id) { product in
              ProductView(state: .init(name: product.name,
                                       description: product.description,
                                       availability: product.available,
                                       price: product.priceDecs,
                                       rating: product.ratingDecs,
                                       image: product.imageUrl)
              )
            }
          }
          .padding(.top, 5)
        }
      }
      .padding()
      .onAppear {
        viewStore.send(.onAppear)
      }
      .navigationTitle("Product Details")
    }
  }
}
