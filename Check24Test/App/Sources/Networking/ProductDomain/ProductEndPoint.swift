//
//  ProductEndPoint.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Foundation
import Microya

/// The collection of supported endpoints of the product domain
enum ProductEndPoint {
    /// Request to get products
    case getProducts
}

extension ProductEndPoint: Endpoint {
    typealias ClientErrorType = ProductError

    var headers: [String : String] {
        [:]
    }

    var subpath: String {
        switch self {
        case .getProducts:
            return "/products-test.json"
        }
    }

    var method: HttpMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }

    var decoder: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }
}



