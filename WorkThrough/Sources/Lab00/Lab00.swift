// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SystemPackage

@main
struct Lab00 {
    static func main() throws {
        let jsonPath = FilePath(#filePath)
            .removingLastComponent()
            .removingLastComponent()
            .removingLastComponent()
            .appending("Resources")
            .appending("Lab00")
            .appending("cases.json")
        
        let fd = try FileDescriptor.open(jsonPath, .readOnly)
        let size = try fd.seek(offset: 0, from: .end)
        let _ = try fd.seek(offset: 0, from: .start)
        let str : String = try fd.closeAfter {
            try String(unsafeUninitializedCapacity: Int(size)) { buffer in
                try fd.read(fromAbsoluteOffset: 0, into: .init(buffer))
            }
        }

        let jsonDecoder = JSONDecoder()
        let cases = try jsonDecoder.decode(Array<Case1>.self, from: str.data(using: .utf8)!)

        let outputer: (String, Bool) -> Void = { message, newline in
            print(message, terminator: newline ? "\n" : "")
        }

        outputer(Self.prelude(), true)

        let count = cases.count
        cases.enumerated()
            .forEach { index, lab in
                outputer("Case: No.\(index + 1), \(count) cases in total".xterm(.Color.yellow), true)
                lab.start(istty: true) {
                    readLine(strippingNewline: true)
                } outputer: { notification in
                    outputer(notification, false)
                }
            }
    }

    static func prelude() -> String {
        "What would Swift display? If you get stuck, try it out with swift repl!"
    }
}

protocol Question {
    typealias Inputer = () -> String?
    typealias Outputer = (String) -> Void
    var prelude: String { get }
    var answer: String { get }
}

extension Question {
    /// a single question answer loop
    /// - Parameters:
    ///   - inputer: input for question
    ///   - istty: if is output
    ///   - outputer: output of question answers, has appended newline itself, no need to use newline for terminator
    func start(istty: Bool, inputer: Inputer,  outputer: Outputer) {
       let attributedQuestionPrelude = istty ? (self.prelude+"\n").xterm(.Color.cyan)  : self.prelude

        let attributedInputPrefix = { 
            let inputPrefix = "? "
            return istty ? inputPrefix.xterm(.Color.magenta) : inputPrefix
        }() 

        let attributedFailureNotifiction = {
            let failureNotice = "-- ❌Not quite. Try again! --"
            return istty ? (failureNotice+"\n\n").xterm(.Color.red) : failureNotice
        }() 

        let attributedSuccessNotifiction = {
            let successNotice = "-- ✅OK! --"
            return istty ? (successNotice+"\n\n").xterm(.Color.green) : successNotice 
        }() 

        outputer(attributedQuestionPrelude)
        outputer(attributedInputPrefix)
        var input = inputer()
        while input != self.answer {
            // failure notification
            outputer(attributedFailureNotifiction)
            // prelude
            outputer(attributedInputPrefix)
            input = inputer()
        }
        // success
        outputer(attributedSuccessNotifiction)

    }
}

struct Case1: Question, Codable {
    let prelude: String
    let answer: String
}
