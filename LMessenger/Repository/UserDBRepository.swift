//
//  UserDBRepository.swift
//  LMessenger
//
//  Created by yujaehong on 8/15/24.
//

import Foundation
import Combine
import FirebaseDatabase

protocol UserDBRepositoryType {
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError>
    func getUser(userId: String) -> AnyPublisher<UserObject, DBError>
}

class UserDBRepository: UserDBRepositoryType {
    
    var db: DatabaseReference = Database.database().reference()
    
    func addUser(_ object: UserObject) -> AnyPublisher<Void, DBError> {
        // Firebase에 데이터를 사용하려면 dictionary 형태로 넘겨야함
        // object -> data -> dic (컴파인 연산자로 체이닝할꺼)
        Just(object)
            .compactMap{ try? JSONEncoder().encode($0) }
            .compactMap{ try? JSONSerialization.jsonObject(with: $0, options: .fragmentsAllowed)}
            .flatMap { value in
                Future<Void, Error> { [weak self] promise in
                    self?.db.child(DBKey.Users).child(object.id).setValue(value) { error, _ in
                        if let error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
            }
            .mapError { DBError.error($0) }
            .eraseToAnyPublisher()
    }
    
    func getUser(userId: String) -> AnyPublisher<UserObject, DBError> {
        Future<Any?, DBError> { [weak self] promise in
            self?.db.child(DBKey.Users).child(userId).getData { error, snapshot in
                if let error {
                    promise(.failure(DBError.error(error)))
                } else if snapshot?.value is NSNull {
                    promise(.success(nil))
                } else {
                    promise(.success(snapshot?.value))
                }
            }
        }.flatMap { value in
            if let value {
                // snapshot.value 타입 또한 딕셔너리 형태임..
                // 그래서 우리가 원하는 UserObject로 변환하기 위해
                // 딕셔너리를 데이터화하고
                // 그 데이터를 JSONDecoder를 통해서 parsing
                return Just(value)
                    .tryMap { try JSONSerialization.data(withJSONObject: $0) }
                    .decode(type: UserObject.self, decoder: JSONDecoder())
                    .mapError { DBError.error($0) }
                    .eraseToAnyPublisher()
            } else {
                return Fail(error: .emptyValue).eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
    
}


