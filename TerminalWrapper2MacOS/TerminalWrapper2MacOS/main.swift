//
//  main.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

// here we create class instance for console command
private let keychain = Keychain()
// here we create class instance for make encription and decripton
private let mrc = MRC()

do {
    // here we call our function and put an argument with shell/bash tool type
    let output = try keychain.set(text: "pwd", property: .second)
    // printing command output to xcode app console
    print(output)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

do {
    // here we call our function and put an argument with shell/bash tool type
    let output = try keychain.set(text: "git describe --contains --all HEAD", property: .first)
    // printing command output to xcode app console
    print(output)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

// here we call function that will encrypt our cmd string command "pwd"
let encrypted = mrc.start(string: "pwd")
// if encription was success print to console encrypted data else handle encryption error
print(encrypted ?? "encryption error")

// here we call function that will decrypt our encrypted data
if let encrypted = encrypted,
   let decrypted = mrc.end(encrypted: encrypted) {
    // if let statements help us to understand that decryption was successful
    do {
        // call function that will execute decrypted data (in our case - "pwd")
        let output = try keychain.set(text: decrypted, property: .second)
        // print data to xcode app console
        print(output)
    } catch {
        // handle errors (may be runtime or etc)
        print(error)
    }
} else {
    // handle decryption error
    print("decryption error")
}
