//
//  Base64.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

struct MRC {
    private let slt: String

    init(slt: String) {
        self.slt = slt
    }

    // UTF8 encryption
    func obf(str: String) -> [UInt8] {
        let cpr = [UInt8](slt.utf8)
        var ecd = [UInt8]()
        [UInt8](str.utf8).enumerated().forEach { ecd.append($0.element ^ cpr[$0.offset % cpr.count]) }
        return ecd
    }

    // UTF8 decryption
    func rec(key: [UInt8]) -> String {
        let cpr = [UInt8](slt.utf8)
        var dcd = [UInt8]()
        key.enumerated().forEach { dcd.append($0.element ^ cpr[$0.offset % cpr.count]) }
        return String(bytes: dcd, encoding: .utf8) ?? ""
    }
}
