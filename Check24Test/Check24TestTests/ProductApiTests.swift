//
//  ProductApiTests.swift
//  Check24TestTests
//
//  Created by Bewerber on 08.02.23.
//



import XCTest
import Microya

@testable import Check24Test

final class ProductApiTests: XCTestCase {
    func testFetchProducts() throws {
        let productResponseBody =
        try TestConstants.testApiProvider.performRequestAndWait(
          on: .getProducts,
            decodeBodyTo: ApiCollectionResponse<Product>.self
        )
        .get()

      productResponseBody.products.forEach { product in
        XCTAssertNotNil(product.name)
        XCTAssertNotNil(product.id)
        }
    }
}

