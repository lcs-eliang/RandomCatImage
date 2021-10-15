//
//  RandomCat.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import Foundation

struct breeds: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}

extension breeds {
    
    static let dummyData: [breeds] = [
    
        breeds(
            id: "e82",
            url: "https://cdn2.thecatapi.com/images/e82.jpg",
            width: 1024,
            height: 683)

    ]
    
}
