import UIKit


func printTitle(title: String) {
    print("""
        
        ---------------- \(title) ----------------
        
        """)}

///
        printTitle(title: "Методы и расширения")
///


extension Int {
    func repetition(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetition {
    print("Hello")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

///
        printTitle(title: "Subscript и вложения")
///

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
//            print("decimalBase \(decimalBase)")
//            print("digitIndex \(digitIndex)")
        }
//        print("decimalBase \(decimalBase)")
        print("self \(self)")
        return (self / decimalBase) % 10
    }
}
7465[2]

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// Выведет "+ + - 0 - 0 + "

