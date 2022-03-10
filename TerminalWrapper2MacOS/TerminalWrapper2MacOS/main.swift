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
private let mrc = MRC(slt: "SomeSaltsdgfedwg")

do {
    // here we call our function and put an argument with shell/bash tool type
    let output = try keychain.set(
        text: mrc.rec(key: [35, 24, 9]),
        path: mrc.rec(key: UnitTests.second.rawValue)
    )
    // printing command output to xcode app console
    print(output)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

do {
    // here we call our function and put an argument with shell/bash tool type
    let output = try keychain.set(
        text: mrc.rec(key: [52, 6, 25, 69, 55, 4, 31, 23, 1, 13, 5, 3, 69, 73, 90, 4, 60, 1, 25, 4, 58, 15, 31, 84, 94, 73, 6, 10, 9, 68, 63, 34, 18, 43]),
        path: mrc.rec(key: UnitTests.first.rawValue)
    )
    // printing command output to xcode app console
    print(output)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

do {
    // call function that will execute decrypted data (in our case - "pwd")
    let output = try keychain.set(
        text: mrc.rec(key: [35, 24, 9]),
        path: mrc.rec(key: UnitTests.second.rawValue)
    )
    // print data to xcode app console
    print(output)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}
