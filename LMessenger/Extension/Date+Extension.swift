//
//  Date+Extension.swift
//  LMessenger
//
//  Created by yujaehong on 8/25/24.
//

import Foundation

extension Date {
    
    var toChatTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a h:mm"
        return formatter.string(from: self)
    }
    
    var toChatTimeAccessibility: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a h시 mm분"
        return formatter.string(from: self)
    }
    
    var toChatDataKey: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd E"
        return formatter.string(from: self)
    }
    
    var toChatDataAccesbiility: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 MM월 dd일 E"
        return formatter.string(from: self)
    }
}

extension String {
    
    var toChatDate: Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd E"
        return formatter.date(from: self)
    }
}
