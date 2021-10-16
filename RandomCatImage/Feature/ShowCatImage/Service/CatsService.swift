//
//  catService.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import Foundation

protocol CatService {
    func fetchRandomCats() async throws -> [RandomCat]
}

final class CatsServiceImpl: CatService {
    
    func fetchRandomQuotes() async throws -> [RandomCat] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending("/api/cats"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode([RandomCat].self, from: data)
    }
}
