//
//  Logger.swift
//  FaceAbnormalityDetection
//
//  Created by Avijeet Pandey on 12/11/24.
//

import Foundation

// MARK: - Logger
class Logger {
    // singleton to use logs from centralise place and use only one instance
    static let shared = Logger()
    private init() {}
    
    // base method for logging
    func log(_ message: String,
             level: LogLevel = .info,
             fileName: String = #file,
             functionName: String = #function,
             lineNumber: Int = #line) {
        let fileName = (fileName as NSString).lastPathComponent
        let logMessage = "[\(level.rawValue)] \(fileName) -> \(functionName) [Line: \(lineNumber)]: \(message)"
        print(logMessage)
    }
    
    // utils methods to log quickly
    func info(_ message: String,
              fileName: String = #file,
              functionName: String = #function,
              lineNumber: Int = #line) {
        log(message, level: .info, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    func debug(_ message: String,
               fileName: String = #file,
               functionName: String = #function,
               lineNumber: Int = #line) {
        log(message, level: .debug, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    func warning(_ message: String,
                 fileName: String = #file,
                 functionName: String = #function,
                 lineNumber: Int = #line) {
        log(message, level: .warning, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    func error(_ message: String,
               fileName: String = #file,
               functionName: String = #function,
               lineNumber: Int = #line) {
        log(message, level: .error, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
}
