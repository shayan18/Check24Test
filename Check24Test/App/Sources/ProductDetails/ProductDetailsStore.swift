//
//  ProductDetailsStore.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Foundation
import Microya
import IdentifiedCollections

struct ProductDetailsState: Equatable {
  var product: Product?
}

enum ProductDetailsAction: Equatable {
  case onAppear
  case backPressed
}
