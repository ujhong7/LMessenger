//
//  UploadProvider.swift
//  LMessenger
//
//  Created by yujaehong on 8/20/24.
//

import Foundation
import Combine
import FirebaseStorage
import FirebaseStorageCombineSwift

enum UploadError: Error {
    case error(Error)
}

protocol UploadProviderType {
    func upload(path: String, data: Data, fileNmae: String) -> AnyPublisher<URL, UploadError>
    func upload(path: String, data: Data, fileName: String) async throws -> URL
}

class UploadProvider: UploadProviderType {
    
    // reference는 클라우드의 파일을 가리키는 포인터
    let storageRef = Storage.storage().reference()
    
    func upload(path: String, data: Data, fileNmae: String) -> AnyPublisher<URL, UploadError> {
        let ref = storageRef.child(path).child(fileNmae)
        
        return ref.putData(data)
            .flatMap { _ in
                ref.downloadURL()
            }
            .mapError { .error($0) }
            .eraseToAnyPublisher()
    }
    
    func upload(path: String, data: Data, fileName: String) async throws -> URL {
        let ref = storageRef.child(path).child(fileName)
        let _ = try await ref.putDataAsync(data)
        let url = try await ref.downloadURL()
        
        return url
    }
    
}
