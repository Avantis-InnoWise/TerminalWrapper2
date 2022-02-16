//
//  main.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

// here we create class instance for console command
private let consoleCommand = ConsoleCommand()
// here we create class instance for make encription and decripton
private let base64 = Base64()

do {
    // here we call our function and put an argument with shell/bash tool type
    let wrapperOutput = try consoleCommand.safeWrapper(command: "pwd", commandType: .shell)
    // printing command output to xcode app console
    print(wrapperOutput)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

do {
    // here we call our function and put an argument with shell/bash tool type
    let wrapperOutput = try consoleCommand.safeWrapper(command: "git describe --contains --all HEAD", commandType: .bash)
    // printing command output to xcode app console
    print(wrapperOutput)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

// here we call function that will encrypt our cmd string command "pwd"
let encrypted = base64.encrypt(string: "pwd")
// if encription was success print to console encrypted data else handle encryption error
print(encrypted ?? "encryption error")

// here we call function that will decrypt our encrypted data
if let encrypted = encrypted,
   let decrypted = base64.decrypt(encrypted: encrypted) {
    // if let statements help us to understand that decryption was successful
    do {
        // call function that will execute decrypted data (in our case - "pwd")
        let output = try consoleCommand.safeWrapper(command: decrypted, commandType: .shell)
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
