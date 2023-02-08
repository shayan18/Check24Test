//
//  ImageView.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import SwiftUI

struct ImageView: View {
  var state: ImageViewState

  var body: some View {
    AsyncImage(url: state.url) { result in
      switch result {
      case let .success(image):
        image
          .resizable()
          .cornerRadius(Constants.roundedImageCornerRadius)

      case .failure:
        Image(systemName: Constants.imagePlaceHolder)
          .resizable()
          .cornerRadius(Constants.roundedImageCornerRadius)

      case .empty:
        EmptyView()

      @unknown default:
        Image(systemName: Constants.imagePlaceHolder)
          .resizable()
          .cornerRadius(Constants.roundedImageCornerRadius)

      }
    }
    .frame(width: 75, height: 75)
  }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
  static let state = ImageViewState(url: URL(string: "https://fastly.picsum.photos/id/546/200/300.jpg?hmac=WRVm_tMObPuM2HqJCr5D6N59Mboh73aqEno4MCuu5AE")!)

  static var previews: some View {
    ImageView(state: state)
  }
}
#endif
