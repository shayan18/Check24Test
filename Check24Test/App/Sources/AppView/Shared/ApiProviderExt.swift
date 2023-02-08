//
//  ApiProviderExt.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Microya

extension ApiProvider {
  #if DEBUG
  static var mocked: ApiProvider<ProductEndPoint> {
    ApiProvider<ProductEndPoint>(baseUrl: AppConstants.serverBaseUrl)
  }
  #endif
}
