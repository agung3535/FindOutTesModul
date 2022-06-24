//
//  HomeRepository.swift
//  FindOut
//
//  Created by Putra on 10/06/22.
//

import Foundation
import Combine

//protocol HomeRepositoryProtocol {
//    func getPlayingMove() -> AnyPublisher<[PlayingModel], Error>
//    func getPlayingTv() -> AnyPublisher<[PlayingModel], Error>
//}
//
//// shared instance
//final class HomeRepository: NSObject {
//    var localeDataSource: LocaleDataSource
//    var remoteDataSource: RemoteDataSource
//    
//    init(localeDataSource: LocaleDataSource, remoteDataSource: RemoteDataSource) {
//        self.localeDataSource = localeDataSource
//        self.remoteDataSource = remoteDataSource
//    }
//    
//    static let sharedInstance: (LocaleDataSource, RemoteDataSource) -> HomeRepository = { locale, remote in
//        return HomeRepository(localeDataSource: locale, remoteDataSource: remote)
//    }
//    
//}
//
//extension HomeRepository: HomeRepositoryProtocol {
//    func getPlayingMove() -> AnyPublisher<[PlayingModel], Error> {
//        return self.localeDataSource.getPlaying()
//            .flatMap { result -> AnyPublisher<[PlayingModel], Error> in
//                if result.isEmpty {
//                    return self.remoteDataSource.getAllMovie()
//                        .map { PlayingMapper.mapResponseMovieToPlayingMovieEntities(input: $0.results!)}
//                        .flatMap { self.localeDataSource.addPlaying(input: $0) }
//                        .flatMap { _ in
//                            self.localeDataSource.getPlaying().map { PlayingMapper.mapMovieEntitiesToDomain(input: $0)}
//                        }.eraseToAnyPublisher()
//                }else {
//                    return self.localeDataSource.getPlaying()
//                        .map { PlayingMapper.mapMovieEntitiesToDomain(input: $0)}
//                        .eraseToAnyPublisher()
//                }
//            }.eraseToAnyPublisher()
//    }
//    
//    func getPlayingTv() -> AnyPublisher<[PlayingModel], Error> {
//        return self.localeDataSource.getPlayingTv()
//            .flatMap { result -> AnyPublisher<[PlayingModel], Error> in
//                if result.isEmpty {
//                    return self.remoteDataSource.getAllTvShow()
//                        .map { PlayingMapper.mapResponseTvToPlayingTvEntities(input: $0.results!)}
//                        .flatMap { self.localeDataSource.addPlayingTv(input: $0)}
//                        .flatMap { _ in
//                            self.localeDataSource.getPlayingTv()
//                                .map { PlayingMapper.mapTvEntitesToDomain(input: $0)}
//                        }
//                        .eraseToAnyPublisher()
//                }else {
//                    return self.localeDataSource.getPlayingTv()
//                        .map { PlayingMapper.mapTvEntitesToDomain(input: $0)}
//                        .eraseToAnyPublisher()
//                }
//            }.eraseToAnyPublisher()
//    }
//    
//    
//}
