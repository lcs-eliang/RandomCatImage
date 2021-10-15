//
//  catService.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import Foundation

protocol CatService {
    
    func fetchRandomCats() async throws -> [breeds]
}

final class CatServiceImpl: CatService {
    
    func fetchRandomCats() async throws -> [breeds] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending("/v1/images/search"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode([breeds].self, from: data)
    }
}
