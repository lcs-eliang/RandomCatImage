//
//  CatScreen.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import SwiftUI

struct CatScreen: View {
    
    @StateObject private var vm = CatViewModelImpl(
        service: CatServiceImpl()
    )
    
    var body: some View {
        
        Group {
            if vm.images.isEmpty {
                LoadingView(text: "Fetching Images")
            } else {
                List {
                    ForEach(vm.images, id: \.Image) { item in
                        CatImageView(image: item)
                    }
                }
            }
        }
        .task {
            await vm.getRandomImages()
        }
    }
}


struct CatScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatScreen()
    }
}