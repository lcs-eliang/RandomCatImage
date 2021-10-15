//
//  CatImageViewModel.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import Foundation

protocol CatViewModel: ObservableObject {
    func getRandomImages() async
    
}

@MainActor
final class CatViewModelImpl: CatViewModel, ObservableObject {
    
    @Published private(set) var cats: [RandomCat] = []
    
    private let service: CatService
    
    init(service: CatService) {
        self.service = service
    }
    
    func getRandomImages() async {
        do {
            self.cats = try await service.fetchRandomCats()
        } catch {
            print(error)
        }
    }
}
