// The Swift Programming Language
// https://docs.swift.org/swift-book

//import

import Logging
// we need to create a logger, the label works similarly to a DispatchQueue label
let logger = Logger(label: "org.swift61a.lecture01")

@main
struct Lecture {
    static func main() throws {
        let str = shakespeara()
        let words = str.split { char in
            char == " " ||
            char == "\n" ||
            char == "\r" ||
            char == "\t" ||
            char == "," ||
            char == "."
        }
        
        let freq = {
            var dict: [String: Int] = [:]
            words.forEach {
                dict[String($0), default: 0] += 1
            }
            return dict
        }()
        
       freq
            .map { ($0, $1) }
            .sorted { $0.1 > $1.1 }
            .prefix(10)
            .forEach { str, count in
                print("\(str)\t\(count)")
            }
        
        let uniqueStr = freq.map { str, _ in str }
        
        uniqueStr
            .filter {
                $0 == String($0.reversed())
            }
            .forEach {
                print($0)
            }
        
        uniqueStr
            .filter {
                var str = $0
                str.removeLast()
                return freq[str] != nil
            }
            .forEach { str in
                print(str)
            }
        
    }
}
