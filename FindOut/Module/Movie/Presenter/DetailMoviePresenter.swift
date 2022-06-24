//
//  DetailMoviePresenter.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import Foundation
import Combine
import HomeOut
import MovieModule

class DetailMoviePresenter: ObservableObject {
    
    private let detailUsecase: DetailMovieUsecase
    @Published var detail: MovieModulePlayingModel?
    
    public init(detailUsecase: DetailMovieUsecase) {
        self.detailUsecase = detailUsecase
        self.detail = detailUsecase.getDetail()
    }
    
    
    
    
    
}
