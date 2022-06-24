//
//  File.swift
//  
//
//  Created by Putra on 18/06/22.
//

import Foundation
import Combine
import RealmSwift
import CoreFindOut

public struct FavoriteLocaleDataSource: LocaleDataSourceCore {
    
    
    
    public typealias Request = Any
    public typealias Response = FavoriteListEntity
    
    private let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[FavoriteListEntity], Error> {
        return Future<[FavoriteListEntity], Error> { completion in
//            if let realm = self.realm {
                let moviePlay = realm.objects(FavoriteListEntity.self)
                completion(.success(moviePlay.toArray(ofType: FavoriteListEntity.self)))
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
        }.eraseToAnyPublisher()
    }
                                    
                                   
    public func add(entities: [FavoriteListEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
//            if let realm = self.realm {
                do {
                    try realm.write {
                        for data in entities {
                            realm.add(data, update: .all)
                        }
                        completion(.success(true))
                    }
                }catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
        }.eraseToAnyPublisher()
    }
                                    
    
    public func get(id: String) -> AnyPublisher<FavoriteListEntity, Error> {
        fatalError()
    }
    
    public func cek(id: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            let predicate = NSPredicate(format: "id == %@",id)
            
            let result = realm.objects(FavoriteListEntity.self).filter(predicate)
            print("result id \(id) = \(result.toArray(ofType: FavoriteListEntity.self))")
            if result.toArray(ofType: FavoriteListEntity.self).count != 0 {
                completion(.success(true))
            }else {
                completion(.success(false))
            }
        }.eraseToAnyPublisher()
    }
                                    
    public func update(id: Int, entity: FavoriteListEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    public func delete(object: FavoriteListEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try realm.write {
                    realm.delete(realm.objects(FavoriteListEntity.self).filter("id=%@",object.id))
//                    realm.delete(object)
                }
                print("masuk delete")
                completion(.success(true))
                
            }catch {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    
    
    
    
}
