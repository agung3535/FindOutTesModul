//
//  File.swift
//  
//
//  Created by Putra on 18/06/22.
//

import Foundation
import CoreFindOut

public struct FavoriteModuleTransformer: Mapper {
    
    
    public typealias Response = DetailMovieResponse
    
    public typealias Entity = [FavoriteListEntity]
    
    public typealias Domain = [FavoriteModel]
    
    public init(){}
    
    
    public func transformResponseToEntity(response: DetailMovieResponse) -> [FavoriteListEntity] {
        var fav = [FavoriteListEntity]()
        let data = FavoriteListEntity()
        data.id = "\(response.id ?? 0)"
        data.title = response.title ?? "Unknown"
        data.image = response.backdropPath ?? ""
        data.rating = "\(response.voteAverage ?? 0.0)"
        data.overview = response.overview ?? "No description"
        data.originalLanguage = response.originalLanguage ?? "Unknown"
        
        fav.append(data)
        return fav
    }
    
    
    public func transformEntityToDomain(entity: [FavoriteListEntity]) -> [FavoriteModel] {
        return entity.map { result in
            return FavoriteModel(id: Int(result.id) ?? 0, title: result.title, image: result.image, rating: Double(result.rating) ?? 0.0, overview: result.overview, originalLanguage: result.originalLanguage)
        }
    }
    
    
    
   
}
