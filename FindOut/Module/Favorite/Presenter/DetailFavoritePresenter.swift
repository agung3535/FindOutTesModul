//
//  DetailFavoritePresenter.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import Foundation
import Combine
import FavoriteModule

class DetailFavPresenter: ObservableObject {
    
    private let detailUsecase: DetailFavUsecase
    @Published var detail: FavoriteModel?
    
    public init(detailUsecase: DetailFavUsecase) {
        self.detailUsecase = detailUsecase
        self.detail = detailUsecase.getDetail()
    }
    
    
    
    
    
}
