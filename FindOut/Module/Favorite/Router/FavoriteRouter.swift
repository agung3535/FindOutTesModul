//
//  FavoriteRouter.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import Foundation
import CoreFindOut
import HomeOut
import SwiftUI
import MovieModule
import FavoriteModule

class FavoriteRouter {
    func makeDetailView(model: FavoriteModel) -> some View {
        let detailUseCase = Injection.init().provideDetailFavUsecase(model: model)
        let presenter = DetailFavPresenter(detailUsecase: detailUseCase)
        let favoriteUsecase: InteractorFavorite<[FavoriteListEntity], [FavoriteModel], FavoriteModuleRepo<FavoriteLocaleDataSource, FavoriteRemoteDataSource, FavoriteModuleTransformer>> = Injection.init().provideFavoriteUseCase()
        let favoritePresenter = FavoritePresenter(useCase: favoriteUsecase)
        return DetailFavPage(presenter: presenter, favoritePresenter: favoritePresenter)
//        let presenter = DetailPresenter(detailUseCase: detailUseCase)
//        return DetailPage(presenter: presenter)
    }
    

}
