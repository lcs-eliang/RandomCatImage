//
//  CatImageView.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import SwiftUI

struct CatImageView: View {

    let image: breeds
    
    
    var body: some View {
        
        VStack(alignment: .center) {
                        
            AsyncImage(url: URL(string: image.url)!){ phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 300, maxHeight: 600)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            
       
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(image: breeds.dummyData.first!)
    }
}
