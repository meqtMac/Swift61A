#if os(Linux)
import Glibc
#elseif os(macOS)
import Darwin
#endif


func istty() -> Bool {
    return isatty(STDOUT_FILENO) != 0
}

// assume tty support xterm escape sequence
let supportXTerm = istty()


enum XTerm {
   struct Color {
        let r: UInt8
        let g: UInt8
        let b: UInt8
    }
    case color(Color)
    case reset

    func escapeSequence() -> String {
        switch self {
        case let .color(color):
            return "\u{001B}[38;2;\(color.r);\(color.g);\(color.b)m"
        case .reset:
            return "\u{001B}[0m"
        }
    }
}

extension XTerm.Color {
    static var red: XTerm = .color(XTerm.Color(r: 255, g: 0, b: 0))
    static var green: XTerm = .color( XTerm.Color(r: 0, g: 255, b: 0))
    static var blue: XTerm = .color(XTerm.Color(r: 0, g: 0, b: 255))
    static var yellow: XTerm = .color( XTerm.Color(r: 255, g: 255, b: 0))
    static var magenta: XTerm = .color(XTerm.Color(r: 255, g: 0, b: 255))
    static var cyan: XTerm = .color(XTerm.Color(r: 0, g: 255, b: 255))
    static var black: XTerm = .color(XTerm.Color(r: 0, g: 0, b: 0))
}

extension StringProtocol {
    func xterm(_ attribute: XTerm, reset: Bool = true) -> String {
        return attribute.escapeSequence() + String(self) +  ( reset ? XTerm.reset.escapeSequence() : "" )
   }
}
