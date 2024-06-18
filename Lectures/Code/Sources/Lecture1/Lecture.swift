// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

@main
struct Lecture01 {
    static func main() throws {
        let str = shakespeara()
        let words = str.components(separatedBy: .whitespacesAndNewlines)
       
        let freq = {
            var dict: [String: Int] = [:]
            words.forEach {
                dict[String($0), default: 0] += 1
            }
            return dict
        }()
        
        freq.map { (str: $0, count: $1) }
            .sorted { $0.count > $1.count }
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
