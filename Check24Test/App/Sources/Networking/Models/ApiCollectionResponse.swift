//
//  ApiCollectionResponse.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

/// The top level response structure of all endpoints providing body data.
struct ApiCollectionResponse<T: Decodable & Equatable>: Decodable, Equatable {
    /// The responses 'primary data' where the expected data type differs from endpoint to endpoint, thus it's provided as a generic type. Required.
    let products: [T]
    let header: Header
    let filters: [String]
}

