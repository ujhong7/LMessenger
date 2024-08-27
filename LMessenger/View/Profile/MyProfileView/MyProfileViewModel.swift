//
//  MyProfileViewModel.swift
//  LMessenger
//
//  Created by yujaehong on 8/17/24.
//

import Foundation
import PhotosUI
import _PhotosUI_SwiftUI

// @MainActor 클래스 내부에 있는 것들이 MainActor에서 접근할수있음
@MainActor
class MyProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    @Published var isPresentedDescEditView: Bool = false
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            // selection이 추가되었을때
            // didSet이 됐을때 그것을 데이터화 하는 작업
            Task {
                await updateProfileImage(pickerItem: imageSelection)
            }
        }
    }
    
    private var container: DIContainer
    private let userId: String
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId) {
            userInfo = user
        }
    }
    
    func updateDescription(_ description: String) async {
        do{
            try await container.services.userService.updateDescription(userId: userId, description: description)
            userInfo?.description = description
        } catch {
            
        }
    }
    
    func updateProfileImage(pickerItem: PhotosPickerItem?) async {
        guard let pickerItem else { return }
        
        do {
            let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
            let url =  try await container.services.uploadService.uploadImage(source: .profile(userId: userId), data: data)
            try await container.services.userService.updateProfileURL(userId: userId, urlString: url.absoluteString)
            
            userInfo?.profileURL = url.absoluteString
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
