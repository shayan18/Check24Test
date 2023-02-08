//
//  ProductView.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import SwiftUI

struct ProductView: View {
    var state: ProductState

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
              if state.availability {
                ImageView(state: ImageViewState(url: state.image))
              }
                VStack(alignment: .leading, spacing: 5) {
                    Text(state.name)
                    .bold()
                    Text(state.description)
                    .foregroundColor(.gray)
                    .font(.footnote)
                  HStack {
                    Text(state.price)
                      .font(.footnote)
                      .bold()
                    Spacer()
                    Text(state.rating)
                      .font(.footnote)
                  }
                }
              if !state.availability {
                ImageView(state: ImageViewState(url: state.image))
              }
            }
            .padding()
            .border(.gray)
        }
    }
}

#if DEBUG
struct ProductView_Previews: PreviewProvider {
    static let state = ProductState(
      name: "abc",
      description: "testingtestingtestingtestingtestingtestingtestingtestingtestingtesting",
      availability: true,
      price: "3.99",
      rating: "5",
      image: URL(string: "https://fastly.picsum.photos/id/546/200/300.jpg?hmac=WRVm_tMObPuM2HqJCr5D6N59Mboh73aqEno4MCuu5AE")!)

    static var previews: some View {
      ProductView(state: state)
    }
}
#endif





