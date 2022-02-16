//
//  CommandType.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

// enumeration of Command Type that we use for filePath
enum ExecutionCommandType {
    case bash
    case shell
    
    var rawValue: String {
        switch self {
        case .bash:
            return "/bin/bash"
        case .shell:
            return "/bin/zsh"
        }
    }
}
