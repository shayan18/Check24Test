//
//  TestConstants.swift
//  Check24TestTests
//
//  Created by Bewerber on 08.02.23.
//

import Foundation
import ComposableArchitecture
import Microya
@testable import Check24Test

enum TestConstants {
  /// The delay to put on API requests returning a result.
  static let requestDelay: DispatchQueue.SchedulerTimeType.Stride = .milliseconds(300)

  /// The test scheduler to control time in tests.
  static let scheduler: TestScheduler = DispatchQueue.test

  static let testApiProvider: ApiProvider<ProductEndPoint> = .init(
      baseUrl: URL(string: "http://app.check24.de")!
  )
}
