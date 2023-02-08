//
//  ProductStore.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Foundation

struct ProductState {
    var name: String
    var description: String
    var availability: Bool
    var price: String
    var rating: String
    var image: URL?
}

enum ProductAction {
  case Tapped
}

