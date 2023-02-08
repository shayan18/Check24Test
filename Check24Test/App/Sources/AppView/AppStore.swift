//
//  AppStore.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Foundation

struct AppState: Equatable {
    var productListState: ProductListState?
}

enum AppAction: Equatable {
case didAppear
case productList(action: ProductListAction)
}

