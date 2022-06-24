//
//  EndPoint.swift
//  FindOut
//
//  Created by Putra on 09/06/22.
//

import Foundation


struct API {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let APIKEY = "api_key=80b5fd4d416c198a2917e73df9fec5d9"
    static let imageURL = "https://image.tmdb.org/t/p/w500/"
}

protocol EndPoint {
    var url: String { get }
}


enum EndPoints {
    enum EP: EndPoint {
        case allMovies
        case allTvList
        case popularMovie
        case popularTc
        case detailMovie(String)
        
        var url: String {
            switch self {
                
            case .allMovies:
                return "\(API.baseUrl)/movie/now_playing?\(API.APIKEY)"
            case .allTvList:
                return "\(API.baseUrl)/tv/airing_today"
            case .popularMovie:
                return "\(API.baseUrl)/movie/popular?\(API.APIKEY)"
            case .popularTc:
                return "\(API.baseUrl)/tv/popular"
            case .detailMovie(let movieId):
                return "\(API.baseUrl)/movie/\(movieId)?\(API.APIKEY)"
            }
        }
    }
}

