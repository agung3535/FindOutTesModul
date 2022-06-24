//
//  File.swift
//  
//
//  Created by Putra on 19/06/22.
//

import Foundation
import CoreFindOut
import Combine
import Alamofire

public struct FavoriteRemoteDataSource: FavoriteRemoteDataSourceCore {
    
    
    public typealias Request = Any
    
    public typealias Response = DetailMovieResponse
    
    
    public init() {
      
    }
    
    public func execute(request: Any?, id: Int, endPoint: String) -> AnyPublisher<DetailMovieResponse, Error> {
        return Future<DetailMovieResponse, Error> { completion in
            if let url = URL(string: endPoint) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: DetailMovieResponse.self, completionHandler: { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    })
            }
        }.eraseToAnyPublisher()
    }
    
}
