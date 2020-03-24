import UIKit

print("""

---------------- Перечисление / enum ----------------

""")

enum CompasdPoint: String {
    case north // default val == north
    case south
    case east
    case west
}


let sunsetDirectionName = CompasdPoint.west // west
let sunsetDirection = CompasdPoint.west.rawValue // "west"

enum Planet: Int {
    case murcury = 1, venus, earth, mars, jupiter, saturn, uranus, neptun
}

let earthsName = Planet.earth // earth
let earthsOrder = Planet.earth.rawValue // 3
let possiblePlanet = Planet(rawValue: 17) // nil

// назначение значения перемненной
var directionToHead = CompasdPoint.west
// изменение значения перемненной
directionToHead = .east

switch directionToHead {
case .north:
    print("We go to north")
case .south:
    print("We go to south")
case .east:
    print("We go to east")
case .west:
    print("We go to west")
}

let somePlanet = Planet.mars

switch somePlanet {
case .earth:
    print("Земля пригодна для жизни")
default:
    print("Эта планета не пригодна для жизни")
}

// Связаные значения перечислений

enum Barcode {
    case ups(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.ups(8, 898, 324, 098)

//productBarcode = .qrCode("dsdsdadwsfg")

switch productBarcode {
case .ups(let numderSys, let manufacture, let product, let check):
    print("UPC: \(numderSys), \(manufacture), \(product), \(check)")
case .qrCode(let productCode):
    print("QRCode: \(productCode)")
}

/// Исходные значения перечислений (default value)

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


/// Рекурсивное перечисления

indirect enum ArithmticExprpession {
    case number(Int)
    case addition(ArithmticExprpession, ArithmticExprpession)
    case multiplucation(ArithmticExprpession, ArithmticExprpession)
}

// (5 + 4) * 2 = 18

let five = ArithmticExprpession.number(5)
let four = ArithmticExprpession.number(4)
let sum = ArithmticExprpession.addition(five, four)
let product = ArithmticExprpession.multiplucation(sum, ArithmticExprpession.number(2))

func evaluate(_ expression: ArithmticExprpession) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplucation(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
