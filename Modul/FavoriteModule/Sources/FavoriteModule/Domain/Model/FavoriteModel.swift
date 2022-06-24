//
//  File.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation

public struct FavoriteModel: Identifiable {
    public let id: Int
    public let title: String
    public let image: String
    public let rating: Double
    public let overview: String
    public let originalLanguage: String
}
