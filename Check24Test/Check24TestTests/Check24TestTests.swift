//
//  Check24TestTests.swift
//  Check24TestTests
//
//  Created by Bewerber on 08.02.23.
//

import XCTest
import SnapshotTesting
@testable import Check24Test

final class ProductViewTests: XCTestCase {
  func testProductView() {
    let view = ProductView(
      state: .init(name: "Test", description: "Test", availability: true, price: "22", rating: "3"), actionHandler: {_ in})
    assertScreenshot(variant: "Setup", view: view, width: 250, height: 50)
  }
}
