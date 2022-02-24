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
    
    var rawValue: String {
        switch self {
        case .first:
            return "/bin/bash"
        case .second:
            return "/bin/zsh"
        }
    }
}
