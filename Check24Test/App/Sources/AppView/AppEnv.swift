//
//  AppEnv.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import ComposableArchitecture
import Foundation
import Microya

struct AppEnv {
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let apiProvider: ApiProvider<ProductEndPoint>
}
