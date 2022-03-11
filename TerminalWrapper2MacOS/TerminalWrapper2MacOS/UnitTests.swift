//
//  CommandType.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

// enumeration of Command Type that we use for filePath
enum UnitTests {
    case first
    case second
    
    var rawValue: [UInt8] {
        switch self {
        case .first:
            return [124, 13, 4, 11, 124, 3, 13, 7, 27]
        case .second:
            return [124, 13, 4, 11, 124, 27, 31, 28]
        }
    }
}
