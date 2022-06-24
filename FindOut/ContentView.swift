//
//  ContentView.swift
//  FindOut
//
//  Created by Putra on 03/06/22.
//

import SwiftUI
import CoreFindOut
import HomeOut
import FavoriteModule

struct ContentView: View {
//    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var homePresenter: GetListPresenter<Any?, HomePlayingModel, InteractorCore<Any, [HomePlayingModel], HomeModuleMovieRepo<HomeMovieLocaleDataSource, HomeRemoteDataSource, HomeMovieTransformer>>>
    @EnvironmentObject var favoritePresenter: FavoritePresenter<[FavoriteListEntity]?, FavoriteModel, InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource, FavoriteModuleTransformer>>>
    var homeRouter: HomeRouter
    var favRouter: FavoriteRouter
    var body: some View {
        NavigationView{
            TabBar(homePresenter: homePresenter, favoritePresenter: favoritePresenter, router: homeRouter, favRouter: favRouter)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)


        }
//        NavigationView{
//            NavigationTabBar(homePresenter: homePresenter)
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//
//        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
