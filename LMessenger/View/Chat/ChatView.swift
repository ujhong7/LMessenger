//
//  ChatView.swift
//  LMessenger
//
//  Created by yujaehong on 8/22/24.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var viewModel: ChatViewModel
    
    var body: some View {
        Text("ChatView")
    }
    
}

struct ChatView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChatView(viewModel: .init(container: DIContainer(services: StubService()),
                                  chatRoomId: "chatRoom1_id",
                                  myUserId: "user1_id",
                                  otherUserId: "user2_id"))
    }
}
