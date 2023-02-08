//
//  Product.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

import Foundation

/// The Product response object.
struct Product: Decodable, Equatable {
    let id: Int
    let name: String
    let type: TypeEnum
    let color: Color
    let imageURL: String
    let colorCode: ColorCode
    let available: Bool
    let releaseDate: Int
    let description, longDescription: String
    let rating: Double
    let price: Price

  var imageUrl: URL? {
      URL(string: imageURL)
  }

  var ratingDecs: String {
     "Rating: \(rating)"
  }

  var priceDecs: String {
    "Price: \(price.value.toString() + " \(price.currency.rawValue)")"
  }
}

// MARK: - Header
struct Header: Decodable, Equatable {
    let headerTitle, headerDescription: String
}

enum Color: String, Decodable, Equatable {
    case blue = "Blue"
    case green = "Green"
    case red = "Red"
    case yellow = "Yellow"
}

enum ColorCode: String, Decodable, Equatable {
    case bbdefb = "BBDEFB"
    case c8E6C9 = "C8E6C9"
    case ffCDD2 = "ffCDD2"
    case ffecb3 = "FFECB3"
}

// MARK: - Price
struct Price: Decodable, Equatable {
    let value: Double
    let currency: Currency
}

enum Currency: String, Decodable, Equatable {
    case eur = "EUR"
}

enum TypeEnum: String, Decodable, Equatable {
    case circle = "Circle"
    case hexagon = "Hexagon"
    case square = "Square"
    case triangle = "Triangle"
}

