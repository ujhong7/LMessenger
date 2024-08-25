//
//  Date+Extension.swift
//  LMessenger
//
//  Created by yujaehong on 8/25/24.
//

import Foundation

extension Date {
    
    var toChatDataKey: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd E"
        return formatter.string(from: self)
    }
}
