//
//  CatImageView.swift
//  RandomCatImage
//
//  Created by Emily Liang on 2021/10/14.
//

import SwiftUI

struct CatImageView: View {

    let image: RandomCat
    
    var body: some View {
        VStack(alignment: .center) {
            Text(image.id)
            
            AsyncImage(url: URL(string: image.url)!)
        }
       .padding()
       .foregroundColor(.black)

    }
    
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(image: RandomCat.dummyData.first!)
    }
}