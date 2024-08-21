//
//  DiskStorage.swift
//  LMessenger
//
//  Created by yujaehong on 8/21/24.
//

import UIKit

protocol DiskStorageType {
    func value(for key: String) throws -> UIImage?
    func store(for key: String, image: UIImage) throws
}

class DiskStorage: DiskStorageType {
    
    let fileManager: FileManager
    let directoryURL: URL
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        // cache/ImageCache
        self.directoryURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("ImageCache")
    }
    
    func createDirectory() {
        guard !fileManager.fileExists(atPath: directoryURL.path()) else { return }
        
        do {
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
        } catch {
            print(error)
        }
    }
    
    func cacheFileURL(for key: String) -> URL {
        let fileName = sha256(key)
        return directoryURL.appendingPathComponent(fileName, isDirectory: false)
    }
    
    // 값을 가져오는 부분
    func value(for key: String) throws -> UIImage? {
        let fileURL = cacheFileURL(for: key)
        
        guard fileManager.fileExists(atPath: fileURL.path()) else {
            return nil
        }
        
        let data = try Data(contentsOf: fileURL)
        return UIImage(data: data)
    }
    
    // 값을 저장하는 부분
    func store(for key: String, image: UIImage) throws {
        let data = image.jpegData(compressionQuality: 0.5)
        let fileURL = cacheFileURL(for: key)
        try data?.write(to: fileURL)
    }
}
