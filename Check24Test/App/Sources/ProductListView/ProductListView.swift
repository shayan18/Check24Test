//
//  ProductListView.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture
import SwiftUI

struct ProductListView: View {
  let store: Store<ProductListState, ProductListAction>

  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        if viewStore.shouldShowProgressIndicator {
          VStack {
            Spacer()
            ActivityIndicator(
              style: .large,
              isAnimating: viewStore.binding(
                get: \.shouldShowProgressIndicator,
                send: ProductListAction.setProgressIndicator
              )
            )
            Spacer()
          }
        } else {
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
                                         image: product.imageUrl), actionHandler: { _ in

                    viewStore.send(.productSelected(product: product))
                }
                )
              }
            }

            NavigationLink(
              destination: IfLetStore(
                store.scope(
                    state: \.productDetailsState,
                    action: ProductListAction.productDetails(action:)
                ),
                then: ProductDetailsView.init(store:)
            ),
              isActive: viewStore.binding(
                get: { $0.productDetailsState != nil},
                send: ProductListAction.setProductDetails(isPresented:)
              ),
              label: {
                EmptyView()
              })
            .padding(.top, 5)
          }
          
        }
      }
      .padding()
      .onAppear {
        viewStore.send(.onAppear)
      }
      .navigationTitle("Products")
    }
  }
}



