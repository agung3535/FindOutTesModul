//
//  BannerHome.swift
//  FindOut
//
//  Created by Putra on 08/06/22.
//

import SwiftUI

struct BannerHome: View {
    var numberOfImage = 2
    var images = ["atlantica", "basket"]
    var body: some View {
        TabView {
            ForEach(0..<images.count) { index in
                Image("\(images[index])")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page)
    }
}

struct BannerHome_Previews: PreviewProvider {
    static var previews: some View {
        BannerHome()
    }
}
