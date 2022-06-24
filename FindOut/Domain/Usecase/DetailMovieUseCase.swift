//
//  DetailMovieUseCase.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import Foundation
import Combine
import MovieModule

protocol DetailMovieProtocol {
    func getDetail() -> MovieModulePlayingModel
}

class DetailMovieUsecase: DetailMovieProtocol {
    
    private let model: MovieModulePlayingModel
    
    public init(model: MovieModulePlayingModel) {
        self.model = model
    }
    
    func getDetail() -> MovieModulePlayingModel {
        return model
    }
}
