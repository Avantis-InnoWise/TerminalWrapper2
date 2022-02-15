//
//  main.swift
//  TerminalWrapper2MacOS
//
//  Created by Yahor Yauseyenka on 15.02.22.
//

import Foundation

// function that execute shell/bash commands with errors handling
func wrapper(command: String, commandType: CommandType) throws -> String {
    // Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution
    let task = Process()
    let pipe = Pipe() // file handling class
    
    task.standardOutput = pipe // Sets the standard output for the receiver
    task.standardError = pipe // Sets the standard error for the receiver
    // - c flag - Use Cscore processing of the scorefile
    task.arguments = ["-c", command] // Sets the command arguments that should be used to launch the executable
    task.executableURL = URL(fileURLWithPath: commandType.rawValue) // Sets filePath with selected (shell/bash) command
    
    do {
        try task.run() // run shell/bash command
    } catch { throw error }
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if let output = String(data: data, encoding: .utf8) {
        return output
    } else {
        // handle command execution error
        return "command execution failed"
    }
}

do {
    // here we call our function and put an argument with shell/bash tool type
    let wrapperOutput = try wrapper(command: "pwd", commandType: .shell)
    // printing command output to xcode app console
    print(wrapperOutput)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

do {
    // here we call our function and put an argument with shell/bash tool type
    let wrapperOutput = try wrapper(command: "git describe --contains --all HEAD", commandType: .bash)
    // printing command output to xcode app console
    print(wrapperOutput)
} catch {
    // handle errors (may be runtime or etc)
    print(error)
}

// here we create class instance for make encription and decripton
let base64 = Base64()

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
        let output = try wrapper(command: decrypted, commandType: .shell)
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
