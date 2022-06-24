//
//  MenuSection.swift
//  FindOut
//
//  Created by Putra on 08/06/22.
//

import SwiftUI

struct MenuSection: View {
    var router: HomeRouter
    var menu: [MenuModel]!
    var body: some View {
        ScrollView {
            ForEach(menu) { resource in
                HStack(alignment: .center, spacing: 15) {
                    if resource.title.lowercased() == "movie" {
                        linkToMovie(content: {
                            MenuItemView(title: resource.title, icon: resource.icon)
                        })
                    }
                    
    //                linkToMovie(content: {
    //
    //                })
    //                linkToTv(content: {
    //                    MenuItemView()
    //                })
                    
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                .background(.white)
                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
        
    }
}

extension MenuSection {
    func linkToMovie<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.goToMovieModule(type: "Movie", router: Injection.init().provideMovieRouter())) { content()}
    }

}

//struct MenuSection_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuSection()
//    }
//}
