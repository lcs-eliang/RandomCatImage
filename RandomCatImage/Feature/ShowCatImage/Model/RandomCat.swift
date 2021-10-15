//
//  RandomCat.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import Foundation

struct RandomCat: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}

extension RandomCat {
    
    static let dummyData: [RandomCat] = [
    
        RandomCat(
            id: "e82",
            url: "https://cdn2.thecatapi.com/images/e82.jpg",
            width: 1024,
            height: 683)

    ]
    
}
