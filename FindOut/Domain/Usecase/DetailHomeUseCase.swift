//
//  DetailHomeUseCase.swift
//  FindOut
//
//  Created by Putra on 16/06/22.
//

import Foundation
import Combine
import HomeOut
import FavoriteModule

protocol DetailHomeProtocol {
    func getDetail() -> HomePlayingModel
}

class DetailHomeUsecase: DetailHomeProtocol {
    
    private let model: HomePlayingModel
    
    public init(model: HomePlayingModel) {
        self.model = model
    }
    
    func getDetail() -> HomePlayingModel {
        return model
    }
    
}


