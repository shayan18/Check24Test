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
          Text(state.title)
          Text(state.subTitle)
            HStack(spacing: 5) {
              if state.availability {
                ImageView(state: ImageViewState(url: state.image))
              }
                VStack(alignment: .leading, spacing: 5) {
                    Text(state.name)
                    Text(state.description)
                  HStack {
                    Text(state.price)
                        .lineLimit(1)
                    Spacer()
                    Text(state.rating)
                        .lineLimit(1)
                  }
                }
              if !state.availability {
                ImageView(state: ImageViewState(url: state.image))
              }
            }
            .padding()
            .border(.black)
        }
        .padding()
    }
}

#if DEBUG
struct ProductView_Previews: PreviewProvider {
    static let state = ProductState(
      title: "Test",
      subTitle: "test123",
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





