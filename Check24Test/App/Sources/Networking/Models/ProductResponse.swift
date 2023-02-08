//
//  ApiCollectionResponse.swift
//  Check24Test
//
//  Created by Bewerber on 08.02.23.
//

struct ProductResponse: Decodable, Equatable {
    let products: [Product]
    let header: Header
    let filters: [String]
}

