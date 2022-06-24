////
////  LocaleDataSource.swift
////  FindOut
////
////  Created by Putra on 09/06/22.
////
//
//import Foundation
//import Combine
//import RealmSwift
//
//protocol LocaleDataProtocol {
//    func getPlaying() -> AnyPublisher<[PlayingListEntity], Error>
//    func getPlayingTv() -> AnyPublisher<[PlayingTvListEntity], Error>
//    func addPlaying(input: [PlayingListEntity]) -> AnyPublisher<Bool, Error>
//    func addPlayingTv(input: [PlayingTvListEntity]) -> AnyPublisher<Bool, Error>
////    func getPlayingById(id: String) -> AnyPublisher<PlayingListEntity, Error>
//}
//
//// shared instance
//final class LocaleDataSource: NSObject {
//    let realm: Realm?
//    private init(realm: Realm?) {
//        self.realm = realm
//    }
//    static let sharedInstance: (Realm?) -> LocaleDataSource = { realm in
//        LocaleDataSource(realm: realm)
//    }
//    
//}
//
//extension LocaleDataSource: LocaleDataProtocol {
//    func getPlayingTv() -> AnyPublisher<[PlayingTvListEntity], Error> {
//        return Future<[PlayingTvListEntity], Error> { completion in
//            if let realm = self.realm {
//                let moviePlay = realm.objects(PlayingTvListEntity.self)
//                completion(.success(moviePlay.toArray(data: PlayingTvListEntity.self)))
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
//        }.eraseToAnyPublisher()
//    }
//    
//    func getPlaying() -> AnyPublisher<[PlayingListEntity], Error> {
//        return Future<[PlayingListEntity], Error> { completion in
//            if let realm = self.realm {
//                let moviePlay = realm.objects(PlayingListEntity.self)
//                completion(.success(moviePlay.toArray(data: PlayingListEntity.self)))
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
//        }.eraseToAnyPublisher()
//    }
//    
//    func addPlaying(input: [PlayingListEntity]) -> AnyPublisher<Bool, Error> {
//        return Future<Bool, Error> { completion in
//            if let realm = self.realm {
//                do {
//                    try realm.write {
//                        for data in input {
//                            realm.add(data, update: .all)
//                        }
//                        completion(.success(true))
//                    }
//                }catch {
//                    completion(.failure(DatabaseError.requestFailed))
//                }
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
//        }.eraseToAnyPublisher()
//    }
//    
//    func addPlayingTv(input: [PlayingTvListEntity]) -> AnyPublisher<Bool, Error> {
//        return Future<Bool, Error> { completion in
//            if let realm = self.realm {
//                do {
//                    try realm.write {
//                        for data in input {
//                            realm.add(data, update: .all)
//                        }
//                        completion(.success(true))
//                    }
//                }catch {
//                    completion(.failure(DatabaseError.requestFailed))
//                }
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
//        }.eraseToAnyPublisher()
//    }
//    
//    
//    
//    
//}
//
//extension Results {
//    func toArray<T>(data: T.Type) -> [T] {
//        var array = [T]()
//        for index in 0 ..< count {
//            if let result = self[index] as? T {
//                array.append(result)
//            }
//        }
//        return array
//    }
//}
