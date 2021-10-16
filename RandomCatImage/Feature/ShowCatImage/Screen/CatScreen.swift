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
    func reload()
    {
        Task {
            await vm.getRandomImages()
        }
        
    }
    var body: some View {
        
        VStack {
            
            Text("CATS")
                .font(.title)
                .padding(13)
            
            if vm.cats.isEmpty {
                LoadingView(text: "Fetching Images")
            } else {
                
                List {
                    ForEach(vm.cats, id: \.id) {
                        image in CatImageView(image: image)
                            .frame(width: 300, height: 400)
                    }
                }
                Button(action: {
                    reload()
                }) {
                     Text("More please!")
                    .font(.title3)
                     .padding(12)
                     .foregroundColor(Color.white)
                     .background(Color.purple)
                     .cornerRadius(10)
                }
               .foregroundColor(.black)
               .scaledToFit()
        
               
                
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
