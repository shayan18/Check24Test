//
//  AppReducer.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    let store: Store<AppState, AppAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Group {
                IfLetStore(
                    store.scope(
                        state: \.productListState,
                        action: AppAction.productList(action:)
                    ),
                    then: ProductListView.init(store:)
                )
            }
            .onAppear {
                viewStore.send(.didAppear)
              }
        }
    }
}
