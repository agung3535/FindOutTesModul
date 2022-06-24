////
////  RemoteDataSource.swift
////  FindOut
////
////  Created by Putra on 09/06/22.
////
//
//import Foundation
//import Combine
//import Alamofire
//
//protocol RemoteDataProtocol {
//    func getAllMovie() -> AnyPublisher<MovieListResponse, Error>
//    func getAllTvShow() -> AnyPublisher<TvListResponse, Error>
//}
//
////  shared instance
//final class RemoteDataSource: NSObject {
//    private override init() { }
//    static let sharedInstance: RemoteDataSource = RemoteDataSource()
//}
//
//extension RemoteDataSource: RemoteDataProtocol {
//    func getAllMovie() -> AnyPublisher<MovieListResponse, Error> {
//        return Future<MovieListResponse, Error> { completion in
//            if let url = URL(string: EndPoints.EP.allMovies.url) {
//                AF.request(url)
//                    .validate()
//                    .responseDecodable(of: MovieListResponse.self, completionHandler: { response in
//                        switch response.result {
//                        case .success(let result):
//                            completion(.success(result))
//                        case .failure(_):
//                            completion(.failure(URLError.invalidResponse))
//                        }
//                    })
//            }
//        }.eraseToAnyPublisher()
//    }
//    func getAllTvShow() -> AnyPublisher<TvListResponse, Error> {
//        return Future<TvListResponse, Error> { completion in
//            if let url = URL(string: EndPoints.EP.allTvList.url) {
//                AF.request(url)
//                    .validate()
//                    .responseDecodable(of: TvListResponse.self, completionHandler: { response in
//                        switch response.result {
//                        case .success(let result):
//                            completion(.success(result))
//                        case .failure(_):
//                            completion(.failure(URLError.invalidResponse))
//                        }
//                    })
//            }
//        }.eraseToAnyPublisher()
//    }
//}
