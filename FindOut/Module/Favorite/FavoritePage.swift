//
//  FavoritePage.swift
//  FindOut
//
//  Created by Putra on 19/06/22.
//

import SwiftUI
import CoreFindOut
import FavoriteModule
import Combine

struct FavoritePage: View {
    @ObservedObject var favoritePresenter: FavoritePresenter<[FavoriteListEntity]?, FavoriteModel, InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource,FavoriteRemoteDataSource, FavoriteModuleTransformer>>>
    var favoriteRouter: FavoriteRouter
    var body: some View {
        ScrollView(.vertical) {
            ZStack{
                Color("SecondaryColor")
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    Text("Movie")
                    
                    ScrollView(.horizontal) {
                        if favoritePresenter.isLoading {

                        } else if favoritePresenter.movie.isEmpty {
                            Text("Data Tidak ditemukan")
                                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                                .padding(.vertical, UIScreen.main.bounds.height / 2)
                        } else {
                            HStack {
                                ForEach(0..<self.favoritePresenter.movie.count, content: { index in
                                    linkBuilder(for: self.favoritePresenter.movie[index], content: {
                                        CardItem(name: "\(self.favoritePresenter.movie[index].title)", image: "\(API.imageURL)\(self.favoritePresenter.movie[index].image)", rating: "\(self.favoritePresenter.movie[index].rating)")
                                    })
                                })
                            }
                        }
                        
                    }.onAppear {
                        self.favoritePresenter.movie.removeAll()
                            self.favoritePresenter.getFavMovie(request: nil, index: 0)
                    }
                    
                }
            }
        }.background(Color("SecondaryColor")
            .ignoresSafeArea())
    }
}

extension FavoritePage {
    func linkBuilder<Content: View>(
      for category: FavoriteModel,
      @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(
        destination: favoriteRouter.makeDetailView(model: category)) { content() }
    }
}

//struct FavoritePage_Previews: PreviewProvider {
//    static var previews: some View {
////        FavoritePage()
//    }
//}
