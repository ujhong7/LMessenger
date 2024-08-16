//
//  DBError.swift
//  LMessenger
//
//  Created by yujaehong on 8/15/24.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
}
