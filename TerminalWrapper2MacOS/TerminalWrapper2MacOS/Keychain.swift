//
//  Wrapper.swift
//  TerminalWrapper2MacOS
//
//  Created by Егор Евсеенко on 15.02.22.
//

import Foundation

// class that execute shell/bash console commands
class Keychain {
    // function that execute shell/bash commands with errors handling
    func set(text: String, path: String) throws -> String {
        // Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution.
        let task = Process()
        // An Pipe object represents both ends of a pipe and enables communication through the pipe.
        let pipe = Pipe()
        // If file is an NSPipe object, launching the receiver automatically closes the write end of the pipe in the current task.
        
        // Here we sets the standard output and error for the receiver
        task.standardOutput = pipe
        task.standardError = pipe
        // - c flag - Use Cscore processing of the scorefile
        // Sets the command arguments that should be used to launch the executable
        task.arguments = ["-c", text]
        // Sets file URL of the receiver's executable file.
        if #available(macOS 10.13, *) {
            task.executableURL = URL(fileURLWithPath: path)
        } else {
            task.launchPath = path

        }
        
        // function call for run shell/bash command
        return try runTask(task: task, pipe: pipe)
    }
    
    // function for run shell/bash command
    private func runTask(task: Process, pipe: Pipe) throws -> String {
        do {
            // run selected command (shell/bash)
            if #available(macOS 10.13, *) {
                try task.run()
            } else {
                task.launch()
            }
        } catch {
            // handle command execution error
            throw error
        }
        
        // Reads the available data synchronously up to the end of file or maximum number of bytes.
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            // handle command data
            return output
        } else {
            // handle command execution error
            return "command execution failed"
        }
    }
}
