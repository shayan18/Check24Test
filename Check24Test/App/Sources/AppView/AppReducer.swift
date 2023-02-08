//
//  ContentView.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture

let appReducer = AnyReducer.combine(
    productListReducer
    .optional()
    .pullback(
      state: \AppState.productListState,
      action: /AppAction.productList(action:),
      environment: { $0 }
    ),
    AnyReducer<AppState, AppAction, AppEnv>() { state, action, env in
    switch action {
    case .didAppear:
        state.productListState = .init()

    case .productList:
        break
    }
    return .none
}
)


