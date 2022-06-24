//
//  DetailPresenter.swift
//  FindOut
//
//  Created by Putra on 16/06/22.
//

import Foundation
import Combine
import HomeOut

class DetailPresenter: ObservableObject {
    
    private let detailUsecase: DetailHomeUsecase
    @Published var detail: HomePlayingModel?
    
    public init(detailUsecase: DetailHomeUsecase) {
        self.detailUsecase = detailUsecase
        self.detail = detailUsecase.getDetail()
    }
    
    
    
    
    
}
