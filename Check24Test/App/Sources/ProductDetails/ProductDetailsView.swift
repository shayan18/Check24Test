//
//  ProductDetailsView.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture
import SwiftUI

struct ProductDetailsView: View {
  let store: Store<ProductDetailsState, ProductDetailsAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        ScrollView(.vertical) {
          VStack(alignment: .leading, spacing: 5) {
            HStack {
              ImageView(state: ImageViewState(url: viewStore.state.product?.imageUrl))
              VStack(alignment: .leading, spacing: 5) {
                Text(viewStore.state.product?.name ?? "")
                  .bold()
                Text(viewStore.state.product?.priceDecs ?? "")
                  .foregroundColor(.gray)
                  .font(.footnote)
                HStack {
                  Text(viewStore.state.product?.ratingDecs ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
                }
              }
            }
            Text(viewStore.state.product?.description ?? "")
            .foregroundColor(.gray)
            .font(.footnote)
            .padding(.top, 12)

            Button {
                print("Button was tapped")
            }
          label: {
                Text("Favorite")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)

            }
          .padding([.top, .bottom], 10)
            Text("Long Description")
              .bold()
              .padding([.top, .bottom], 10)
            Text(viewStore.state.product?.longDescription ?? "")
            .foregroundColor(.gray)
            .font(.footnote)
          }
        }.padding()
        .onAppear {
          viewStore.send(.onAppear)
        }
        .onDisappear {
          viewStore.send(.backPressed)
        }
        .navigationTitle("Product Details")
      }
    }
  }
}
  
#if DEBUG
  struct ProductDetailsView_Previews: PreviewProvider {
    static let store = Store(initialState:  ProductDetailsState(product: .init(id: 1, name: "test", type: .circle, color: .blue, imageURL: "https://fastly.picsum.photos/id/546/200/300.jpg?hmac=WRVm_tMObPuM2HqJCr5D6N59Mboh73aqEno4MCuu5AE", colorCode: .bbdefb, available: true, releaseDate: 2, description: "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest", longDescription: "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest", rating: 2.0, price: .init(value: 33.0, currency: .eur))), reducer: productDetailsReducer, environment: .init(mainQueue: .main, apiProvider: .mocked))
    static var previews: some View {
      ProductDetailsView(store: store)
    }
  }
#endif
