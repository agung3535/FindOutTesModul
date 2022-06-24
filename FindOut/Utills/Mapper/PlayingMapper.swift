//
//  PlayingMapper.swift
//  FindOut
//
//  Created by Putra on 10/06/22.
//

import Foundation
import FavoriteModule
import HomeOut

class PlayingMapper {
    
    
    static func mapFavModelToPlayModel(input: FavoriteModel) -> PlayingModel {
        
        let playing = PlayingModel(id: Int(input.id) ?? 0, title: input.title, image: input.image, rating: Double(input.rating ?? 0.0) ?? 0.0, overview: input.overview, originalLanguage: input.originalLanguage)
        return playing
    }
    
    static func mapHomeModelToPlayModel(input: HomePlayingModel) -> PlayingModel {
        
        let playing = PlayingModel(id: Int(input.id) ?? 0, title: input.title, image: input.image, rating: Double(input.rating ?? 0.0) ?? 0.0, overview: input.overview, originalLanguage: input.originalLanguage)
        return playing
    }
    
}
