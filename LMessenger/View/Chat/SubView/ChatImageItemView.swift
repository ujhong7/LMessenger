//
//  ChatImageItemView.swift
//  LMessenger
//
//  Created by yujaehong on 8/27/24.
//

import SwiftUI

struct ChatImageItemView: View {
    
    let urlString: String
    let direction: ChatItemDirection
    let date: Date
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
                dateView
            }
            
            URLImageView(urlString: urlString)
                .frame(width: 146, height: 146)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            if direction == .left {
                dateView
                Spacer()
            }
        }
        .padding(.horizontal, 35)
    }
    
    var dateView: some View {
        Text(date.toChatTime)
            .font(.system(size: 10))
            .foregroundColor(.greyDeep)
            .accessibilityLabel(Text(date.toChatTimeAccessibility))
    }
}

struct ChatItemImageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatImageItemView(urlString: "", direction: .left, date: Date())
    }
}
