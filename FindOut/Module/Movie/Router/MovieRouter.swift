//
//  MovieRouter.swift
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


class MovieRouter {
    func makeDetailView(model: MovieModulePlayingModel) -> some View {
        let detailUseCase = Injection.init().provideDetailMovieUsecase(model: model)
        let presenter = DetailMoviePresenter(detailUsecase: detailUseCase)
        let favoriteUsecase: InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource, FavoriteModuleTransformer>> = Injection.init().provideFavoriteUseCase()
        let favoritePresenter = FavoritePresenter(useCase: favoriteUsecase)
        return DetailPageMovie(presenter: presenter, favoritePresenter: favoritePresenter)
//        let presenter = DetailPresenter(detailUseCase: detailUseCase)
//        return DetailPage(presenter: presenter)
    }
}
