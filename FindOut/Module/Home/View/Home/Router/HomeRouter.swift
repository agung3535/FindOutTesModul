//
//  HomeRouter.swift
//  FindOut
//
//  Created by Putra on 16/06/22.
//

import Foundation
import CoreFindOut
import HomeOut
import SwiftUI
import MovieModule
import FavoriteModule

class HomeRouter {
    func makeDetailView(model: HomePlayingModel) -> some View {
        let detailUseCase = Injection.init().provideDetailUsecase(model: model)
        let presenter = DetailPresenter(detailUsecase: detailUseCase)
        let favoriteUsecase: InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource, FavoriteModuleTransformer>> = Injection.init().provideFavoriteUseCase()
        let favoritePresenter = FavoritePresenter(useCase: favoriteUsecase)
        return DetailPage(presenter: presenter, favoritePresenter: favoritePresenter)
//        let presenter = DetailPresenter(detailUseCase: detailUseCase)
//        return DetailPage(presenter: presenter)
    }
    
    func goToMovieModule(type: String, router: MovieRouter) -> some View {
        let movieUseCase: InteractorMovie<Any, [MovieModulePlayingModel],
                                         MovieModuleRepo<MovieLocaleDataSource,
                                         MovieRemoteDataSource,
                                                             MovieModuleTransformer>> = Injection.init().provideMovieUseCase()
        let moviePresenter = MoviePresenter(useCase: movieUseCase)
        return MoviePage(type: type, moviePresenter: moviePresenter, movieRouter: router)
    }
}
