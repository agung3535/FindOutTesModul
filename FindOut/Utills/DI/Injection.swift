//
//  Injection.swift
//  FindOut
//
//  Created by Putra on 12/06/22.
//

import Foundation
import RealmSwift
import Combine
import CoreFindOut
import HomeOut
import UIKit
import MovieModule
import FavoriteModule

class Injection: NSObject {
    
//    func provideRepository() -> HomeRepositoryProtocol {
//        let realm = try? Realm()
//        let localDataSource = LocaleDataSource.sharedInstance(realm)
//        let remoteDataSource = RemoteDataSource.sharedInstance
//        return HomeRepository.sharedInstance(localDataSource, remoteDataSource)
//    }
//    
//    func provideHomeUsecase() -> HomeUsecase {
//        let repository = provideRepository()
//        return HomeUsecase(homeRepo: repository)
//    }
    
    func provideDetailUsecase(model: HomePlayingModel) -> DetailHomeUsecase {
        return DetailHomeUsecase(model: model)
    }
    
    func provideDetailMovieUsecase(model: MovieModulePlayingModel) -> DetailMovieUsecase {
        return DetailMovieUsecase(model: model)
    }
    
    func provideDetailFavUsecase(model: FavoriteModel) -> DetailFavUsecase {
        return DetailFavUsecase(model: model)
    }
    
    func provideRealm() -> Realm {
        let realm = (try? Realm())!
        return realm
    }
    
    func provideHomeMovieUsecase<U: UseCaseCore>() -> U where U.Request == Any?, U.Response == [HomePlayingModel] {
    
        let realm = provideRealm()
        
        let locale = HomeMovieLocaleDataSource(realm: realm)
        
        let remote = HomeRemoteDataSource(endPoint: EndPoints.EP.allMovies.url)
        
        let mapper = HomeMovieTransformer()
        
        let repository = HomeModuleMovieRepo(localeDataSource: locale, remoteDataSource: remote, mapper: mapper)
//        let interactor = InteractorCore(repository: repository)
        
        return InteractorCore(repository: repository) as! U
        
    }
    
    func provideMovieUseCase<U: MovieUseCase>() -> U where U.Request == Any?, U.Response == [MovieModulePlayingModel] {
        let realm = provideRealm()
        
        let locale = MovieLocaleDataSource(realm: realm)
        
        var endPoint: [String] = []
        endPoint += [EndPoints.EP.popularMovie.url]
        endPoint += [EndPoints.EP.allMovies.url]
        
        let remote = MovieRemoteDataSource(endPoint: endPoint)
        
        let mapper = MovieModuleTransformer()
        
        let repository = MovieModuleRepo(localeDataSource: locale, remoteDataSource: remote, mapper: mapper)
//        let interactor = InteractorCore(repository: repository)
        
        return InteractorMovie(repository: repository) as! U
    }
    
    func provideFavoriteUseCase<U: FavoriteUseCase>() -> U where U.Request == [FavoriteListEntity]?, U.Response == [FavoriteModel] {
        let realm = provideRealm()
        
        let locale = FavoriteLocaleDataSource(realm: realm)
        
        let remote = FavoriteRemoteDataSource()
        
        let mapper = FavoriteModuleTransformer()
        
        let repository = FavoriteModuleRepo(localeDataSource: locale, remoteDataSource: remote, mapper: mapper)
        
        return InteractorFavorite(repository: repository) as! U
    }
    
    func provideHomeRouter() -> HomeRouter {
        return HomeRouter()
    }
    
    func provideMovieRouter() -> MovieRouter {
        return MovieRouter()
    }
    
    func provideFavRouter() -> FavoriteRouter {
        return FavoriteRouter()
    }
    
//    func provideHomeDetailUsecase<U: UseCaseCore>() -> U where U.Request == Any?, U.Response == HomePlayingModel {
//
//    }
}
