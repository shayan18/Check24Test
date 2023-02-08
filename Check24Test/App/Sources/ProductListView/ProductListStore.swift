//
//  ProductListStore.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Foundation
import Microya
import IdentifiedCollections

struct ProductListState: Equatable {
  var products: [Product] = []
  var productHeader: Header?
  var shouldShowProgressIndicator = false
  var errorMessage: String = ""
}

enum ProductListAction: Equatable {
    case onAppear
    case setProgressIndicator(Bool)
    case receivedProductResponse(Result<ProductResponse, ApiError<ProductError>>)
}
