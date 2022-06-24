//
//  FindOutApp.swift
//  FindOut
//
//  Created by Putra on 03/06/22.
//

import SwiftUI
import CoreFindOut
import HomeOut
import MovieModule
import FavoriteModule
//import RealmSwift

@main
struct FindOutApp: SwiftUI.App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            let movieUsecase: InteractorCore<Any, [HomePlayingModel],
                                             HomeModuleMovieRepo<HomeMovieLocaleDataSource,
                                             HomeRemoteDataSource,
                                                                 HomeMovieTransformer>> = Injection.init().provideHomeMovieUsecase()
            let favoriteUsecase: InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource,FavoriteModuleTransformer>> = Injection.init().provideFavoriteUseCase()
                                                
            let homePresenter = GetListPresenter(useCase: movieUsecase)
            let favoritePresenter = FavoritePresenter(useCase: favoriteUsecase)
            let homeRouter = Injection.init().provideHomeRouter()
            let favRouter = Injection.init().provideFavRouter()
            ContentView(homeRouter: homeRouter, favRouter: favRouter)
                .environmentObject(homePresenter)
                .environmentObject(favoritePresenter)
        }
    }
    
    
}
