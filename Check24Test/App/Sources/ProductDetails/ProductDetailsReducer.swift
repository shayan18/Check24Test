//
//  ProductDetailsReducer.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture
import Foundation

let productDetailsReducer = AnyReducer<ProductDetailsState, ProductDetailsAction, AppEnv>() { state, action, env in
  switch action {
  case .onAppear:
    break

  case .backPressed:
    break
    
  }
  return .none
}

