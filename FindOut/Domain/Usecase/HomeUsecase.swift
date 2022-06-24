//
//  HomeUsecase.swift
//  FindOut
//
//  Created by Putra on 11/06/22.
//

import Foundation
import Combine

//protocol HomeUsecaseProtocol {
//    func getMovie() -> AnyPublisher<PlayingModel, Error>
//    func getTv() -> AnyPublisher<PlayingModel, Error>
//}
//
//
//class HomeUsecase: NSObject {
//    let homeRepo: HomeRepositoryProtocol
//    
//    init(homeRepo: HomeRepositoryProtocol) {
//        self.homeRepo = homeRepo
//    }
//
////    static var sharedInstance: (HomeRepository) -> HomeUsecase = { homeRepo in
////        return HomeUsecase(homeRepo: homeRepo)
////    }
//}
//
//extension HomeUsecase: HomeRepositoryProtocol {
//    func getPlayingMove() -> AnyPublisher<[PlayingModel], Error> {
//        return homeRepo.getPlayingMove()
//    }
//    
//    func getPlayingTv() -> AnyPublisher<[PlayingModel], Error> {
//        return homeRepo.getPlayingTv()
//    }
//    
//    
//}
