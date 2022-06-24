//
//  BannerHome.swift
//  FindOut
//
//  Created by Putra on 08/06/22.
//

import SwiftUI
import MovieModule
import Kingfisher
struct BannerHome: View {
    var numberOfImage = 1
    @State var movie: [MovieModulePlayingModel]
    var images = ["atlantica"]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(0..<5 ,content: { index in
                    
                    KFImage(URL(string: "\(API.imageURL)\(movie[index].image)"))
                        .resizable()
                        .scaledToFill()
           
                    
                })
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page)
            
        }
    }
}

//struct BannerHome_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerHome()
//    }
//}
