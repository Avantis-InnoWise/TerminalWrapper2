//
//  Base64.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

//Base64 class for encryption and decryption
class MRC {
    // Base64 encryption
    func end(encrypted: String) -> String? {
        // check if we can convert encrypted data to correct format
        guard let data = Data(base64Encoded: encrypted) else {
            return nil
        }
        
        // return decrypted string
        return String(data: data, encoding: .utf8)
    }
    // Base64 decryption
    func start(string: String) -> String? {
        // return encrypted string
        return Data(string.utf8).base64EncodedString()
    }
}
