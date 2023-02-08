//
//  ProductError.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//


/// Represents a single error with some additional information on what's wrong.
struct ProductError: Decodable, Equatable {
   let error: String
}
