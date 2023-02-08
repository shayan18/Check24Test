//
//  ProductListReducer.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//


import ComposableArchitecture
import Foundation
import Microya

let productListReducer = AnyReducer<ProductListState, ProductListAction, AppEnv>() { state, action, env in
    switch action {
    case .onAppear:

      state.shouldShowProgressIndicator = true
      return env.apiProvider
        .publisher(on: .getProducts, decodeBodyTo: ProductResponse.self)
            .receive(on: env.mainQueue)
            .catchToEffect()
            .cancellable(id: Cancellable(), cancelInFlight: true)
            .map { ProductListAction.receivedProductResponse($0) }


    case let .receivedProductResponse(productResponse):
        switch productResponse {
        case let .success(response):
          state.productHeader = response.header
          state.products = response.products

        case let .failure(error):
            state.errorMessage = error.localizedDescription
        }

      return .init(value: .setProgressIndicator(false))

    case let .setProgressIndicator(isLoading):
      state.shouldShowProgressIndicator = isLoading

    case let .setProductDetails(isPresented):
      state.productDetailsState = isPresented ? .init() : nil

    case .productDetails(action: .backPressed):
      state.selectedProduct = nil
      state.productDetailsState = nil

    case let .productSelected(product):
      state.selectedProduct = nil
      state.productDetailsState = .init(product: product)


    case let .productDetails(action):
      break
    }
    return .none
}

