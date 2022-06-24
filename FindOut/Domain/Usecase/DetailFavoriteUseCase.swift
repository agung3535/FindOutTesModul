//
//  DetailFavoriteUseCase.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import Foundation
import Combine
import HomeOut
import FavoriteModule

protocol DetailFavProtocol {
    func getDetail() -> FavoriteModel
}

class DetailFavUsecase: DetailFavProtocol {
    
    private let model: FavoriteModel
    
    public init(model: FavoriteModel) {
        self.model = model
    }
    
    func getDetail() -> FavoriteModel {
        return model
    }
    
}
