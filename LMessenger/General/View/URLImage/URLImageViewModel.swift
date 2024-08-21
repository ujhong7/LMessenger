//
//  URLImageViewModel.swift
//  LMessenger
//
//  Created by yujaehong on 8/21/24.
//

import UIKit
import Combine

class URLImageViewModel: ObservableObject {
    
    // 로딩이 시작이 되었거나 이미 이미지를 가져왔으면 다시 가져와지지 않는 역할을 하는 프로퍼티
    var loadingOrSuccess: Bool {
        return loading || loadedImage != nil
    }
    
    @Published var loadedImage: UIImage?
    
    private var loading: Bool = false
    private var container: DIContainer
    private var urlString: String
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, urlString: String) {
        self.container = container
        self.urlString = urlString
    }
    
    // 캐시에서 이미지를 가져오는 함수
    func start() {
        guard !urlString.isEmpty else { return }
        
        loading = true
        
        container.services.imageCacheService.image(for: urlString)
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.loading = false
                self?.loadedImage = image
            }.store(in: &subscriptions)
    }
    
}
