//
//  UploadService.swift
//  LMessenger
//
//  Created by yujaehong on 8/20/24.
//

import Foundation
import Combine

// 이미지 업로드 할 경우 2가지 (내프로필,채팅 두곳)
//  UploadSourceType이라는 경로를 관리할 enum을 만들어서 path를 가져올 수 있도록..

protocol UploadServiceType {
    func uploadImage(source: UploadSourceType, data: Data) -> AnyPublisher<URL, ServiceError>
    func uploadImage(source: UploadSourceType, data: Data) async throws -> URL
}

class UploadService: UploadServiceType {
    
    private let provider: UploadProviderType
    
    init(provider: UploadProviderType) {
        self.provider = provider
    }
    
    func uploadImage(source: UploadSourceType, data: Data) -> AnyPublisher<URL, ServiceError> {
        provider.upload(path: source.path, data: data, fileNmae: UUID().uuidString)
            .mapError{ .error($0) }
            .eraseToAnyPublisher()
    }
    
    func uploadImage(source: UploadSourceType, data: Data) async throws -> URL {
        let url = try await provider.upload(path: source.path, data: data, fileName: UUID().uuidString)
        return url
    }
    
}

class StubUploadService: UploadServiceType {
    
    func uploadImage(source: UploadSourceType, data: Data) -> AnyPublisher<URL, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
    
    func uploadImage(source: UploadSourceType, data: Data) async throws -> URL {
        return URL(string: "")!
    }
    
    
}
