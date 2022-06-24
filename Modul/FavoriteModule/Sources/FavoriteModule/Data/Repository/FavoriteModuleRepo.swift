//
//  File.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation
import CoreFindOut
import Combine
import Kingfisher

public struct FavoriteModuleRepo<FavoriteLocaleDataSource: LocaleDataSourceCore, FavoriteRemoteDataSource: FavoriteRemoteDataSourceCore,Transformer: Mapper>: FavoriteRepository where FavoriteLocaleDataSource.Response == FavoriteListEntity, FavoriteRemoteDataSource.Response == DetailMovieResponse, Transformer.Response == DetailMovieResponse,  Transformer.Entity == [FavoriteListEntity], Transformer.Domain == [FavoriteModel] {
    
    public typealias Request = [FavoriteListEntity]
    public typealias Response = [FavoriteModel]
    
    private let localeDataSource: FavoriteLocaleDataSource
    private let remoteDataSource: FavoriteRemoteDataSource
    private let mapper: Transformer
    
    public init(localeDataSource: FavoriteLocaleDataSource, remoteDataSource: FavoriteRemoteDataSource ,mapper: Transformer) {
        self.mapper = mapper
        self.localeDataSource = localeDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public func execute(request: [FavoriteListEntity]?, index: Int) -> AnyPublisher<[FavoriteModel], Error> {
        return localeDataSource.list(request: nil)
            .flatMap { result -> AnyPublisher<[FavoriteModel], Error> in
                return localeDataSource.list(request: nil)
                    .map { mapper.transformEntityToDomain(entity: $0)}
                    .eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    public func add(request: [FavoriteListEntity]?) -> AnyPublisher<Bool, Error> {
        return localeDataSource.add(entities: request as! [FavoriteListEntity])
            .eraseToAnyPublisher()
    }
    
    public func get(id: String, endPoint: String) -> AnyPublisher<Bool, Error> {
        return remoteDataSource.execute(request: nil, id: Int(id) ?? 0, endPoint: endPoint)
            .map { mapper.transformResponseToEntity(response: $0)}
            .flatMap { self.localeDataSource.add(entities: $0) }
            .eraseToAnyPublisher()
            
    }
   
    
    public func cek(id: String) -> AnyPublisher<Bool, Error> {
        return localeDataSource.cek(id: id)
            .map { $0}
            .eraseToAnyPublisher()
    }
    
    
    public func delete(id: String, endPoint: String) -> AnyPublisher<Bool, Error> {
        print("masuk delete repo")
        return remoteDataSource.execute(request: nil, id: Int(id) ?? 0, endPoint: endPoint)
            .map { mapper.transformResponseToEntity(response: $0)}
            .flatMap { self.localeDataSource.delete(object: $0.first!) }
            .eraseToAnyPublisher()
        
    }
    
    
    
}
