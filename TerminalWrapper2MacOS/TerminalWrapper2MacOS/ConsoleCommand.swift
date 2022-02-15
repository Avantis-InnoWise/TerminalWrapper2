//
//  Wrapper.swift
//  TerminalWrapper2MacOS
//
//  Created by Егор Евсеенко on 15.02.22.
//

import Foundation

class ConsoleCommand {
    // function that execute shell/bash commands with errors handling
    func safeWrapper(command: String, commandType: CommandType) throws -> String {
        // Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution
        let task = Process()
        // Pipe objects provide an object-oriented interface for accessing pipes.
        // An Pipe object represents both ends of a pipe and enables communication through the pipe.
        let pipe = Pipe()
        
        task.standardOutput = pipe // Sets the standard output for the receiver
        task.standardError = pipe // Sets the standard error for the receiver
        // - c flag - Use Cscore processing of the scorefile
        task.arguments = ["-c", command] // Sets the command arguments that should be used to launch the executable
        task.executableURL = URL(fileURLWithPath: commandType.rawValue) // Sets filePath with selected (shell/bash) command
        
        return try runTask(task: task, pipe: pipe)
    }
    
    // run shell/bash command
    private func runTask(task: Process, pipe: Pipe) throws -> String {
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
}
