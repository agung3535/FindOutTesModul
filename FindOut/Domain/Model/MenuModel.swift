//
//  MenuModel.swift
//  FindOut
//
//  Created by Putra on 24/06/22.
//

import Foundation


struct MenuModel: Codable, Identifiable {
    var id: Int
    var title: String
    var icon: String
}

enum MainMenu {
    case movie
    
    var resource: MenuModel {
        switch self {
        case .movie:
            return MenuModel(id: 1, title: "Movie", icon: "film")
        }
    }
}
