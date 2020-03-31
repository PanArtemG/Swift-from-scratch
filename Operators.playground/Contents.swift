import Foundation



print("-------------------\"Побитовый оператор\"-------------------")

// ~
let initialBits: UInt8 = 0b0001111
let inverBits = ~initialBits

//& - комбинирует два бита двух чисел / возвращает 1 только если два бита обеих чисел были == 1

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBit = firstSixBits & lastSixBits

print(String(middleFourBit, radix: 2))

// | - возвращает 1 если хотябы один из пары битов имеет бит == 1

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combineBits = someBits | moreBits
print(String(combineBits, radix: 2))

// ^ оператор (ксор) исключающего или / возвращает 1 когда биты разные и 0 когда биты одинаковые
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
print(String(outputBits, radix: 2))

// << - побитового левого сдвига
// >> - правого сдвига

print("-------------------\"Оператор переполнения\"-------------------")

//&+ // переполнение с добавлением
//&- // переполнение с вычитанием
//&* // переполнение с умножением

// Int16 - -32768...32767

var potentialOverflow = UInt8.max // 255
//potentialOverflow += 1  // Error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).

potentialOverflow = potentialOverflow &+ 1 // 0

print("-------------------\"Приоритет и асоциативность\"-------------------")

2 + 3 % 4 * 5 // 17
2 + ((3 % 4) * 5) // 17

print("-------------------\"Операторные функции\"-------------------")

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}


let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)

let combineVector = vector + anotherVector


extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positiveVector = Vector2D(x: 3.0, y: 4.0)
let negativeVector = -positiveVector

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D){
        left = left + right
    }
}


var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)

original += vectorToAdd


extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
           return !(left == right)
       }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("Эти два вектора эквиваленты.")
}
// Выведет "Эти два вектора эквиваленты."

print("-------------------\"Пользовательские операторы\"-------------------")

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}
 
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling.x, afterDoubling.y)
// toBeDoubled имеет значения (1.0, 4.0)
// afterDoubling так же имеет значения (2.0, 8.0)


infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector является экземпляром Vector2D со значениями (4.0, -2.0)
