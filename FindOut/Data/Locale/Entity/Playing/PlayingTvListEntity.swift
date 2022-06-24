//
//  PlayingTvListEntity.swift
//  FindOut
//
//  Created by Putra on 10/06/22.
//

import Foundation
import RealmSwift

class PlayingTvListEntity: Object {
    @Persisted var id: String
    @Persisted var title: String
    @Persisted var rating: String
    @Persisted var image: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
