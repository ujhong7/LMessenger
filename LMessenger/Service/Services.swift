//
//  Services.swift
//  LMessenger
//
//  Created by yujaehong on 8/11/24.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
    var userService: UserServieType { get set }
    var contactService: ContactServiceType { get set }
    var photoPicerService: PhotoPickerServiceType { get set }
    var uploadService: UploadServiceType { get set }
    var imageCacheService: ImageCacheServiceType { get set }
    var chatRoomService: ChatRoomServiceType { get set }
    var chatService: ChatServiceType { get set }
}

class Services: ServiceType {
    var authService: AuthenticationServiceType
    var userService: UserServieType
    var contactService: ContactServiceType
    var photoPicerService: PhotoPickerServiceType
    var uploadService: UploadServiceType
    var imageCacheService: ImageCacheServiceType
    var chatRoomService: ChatRoomServiceType
    var chatService: ChatServiceType
    
    init() {
        self.authService = AuthenticationService()
        self.userService = UserService(dbRepository: UserDBRepository())
        self.contactService = ContactService()
        self.photoPicerService = PhotoPickerService()
        self.uploadService = UploadService(provider: UploadProvider())
        self.imageCacheService = ImageCacheService(memoryStorage: MemoryStorage(), diskStorage: DiskStorage())
        self.chatRoomService = ChatRoomService(dbRepository: ChatRoomDBRepository())
        self.chatService = ChatService(dbRepository: ChatDBRepository())
    }
}

class StubService: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    var userService: UserServieType = StubUserService()
    var contactService: ContactServiceType = StubContactService()
    var photoPicerService: PhotoPickerServiceType = StubPhotoPickerService()
    var uploadService: UploadServiceType = StubUploadService()
    var imageCacheService: ImageCacheServiceType = StubImageCacheService()
    var chatRoomService: ChatRoomServiceType = StubChatRoomService()
    var chatService: ChatServiceType = StubChatService()
}
