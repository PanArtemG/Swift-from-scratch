import UIKit

func printTitle(title: String) {
    print("""

    ---------------- \(title) ----------------

    """)
}

///
printTitle(title: "Методы экземпляра")
///

class Counter {
    var count = 0
    func increment(){
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

/// self
/// mutating

struct Point {
    var x = 0.0 // self.x
    var y = 0.0
    func isToTheRightof(x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX: Double,y deltaY: Double) { // mutating - метод изменяет свойства структуры
        x += deltaX
        y += deltaY
    }
    mutating func moveBy2(x deltaX: Double,y deltaY: Double) { // create new
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 4.0, y: 5.0)

somePoint.moveBy(x: 2.0, y: 3.0)
somePoint.x // 6

enum TriStateSwitch {
    case off, low, hight
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .hight
        case .hight:
            self = .off
        }
    }
}

var overLight = TriStateSwitch.low
overLight.next()
overLight.next()

///
printTitle(title: "Методы типа")
///

/// class funk
///static funk

struct LevelTracker {
    static var highestUnlockLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockLevel {
            highestUnlockLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockLevel
    }
    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Sergey")
player.complete(level: 1)
print("Max lvl: \(LevelTracker.highestUnlockLevel)")

player = Player(name: "Andrey")
if player.tracker.advance(to: 2) {
    print("Player to 2 lvl")
} else {
    print("Lvl 2 locked")
}


///
    printTitle(title: "SubScript [index]")
/// сокращенный вариант доступа к члену коллекции, списка или последовательности
///

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("6 * 3 = \(threeTimesTable[6])")

/// Option SubScript

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row <= rows && column >= 0 && column <= columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[row * columns + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[row * columns + column] = newValue
        }
    }
}


var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5 // [0.0 1.5]
matrix[1, 0] = 3.2 // [3.2 0.0]


///
    printTitle(title: "Inheritance (наследование)")
///

class Venicle {
    var currentSpeed = 0.0
    var description: String {
        return "движется со скорости \(currentSpeed) км/час"
    }
    func makeNoise() {
        
    }
}

let someVenicle = Venicle()
print("Транспорт \(someVenicle.description)")

class Bicycle: Venicle {
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Велосипед \(bicycle.description)")


class Tanden: Bicycle {
    var currentNumberOfPassenger = 0
}

let tandem = Tanden()
tandem.hasBasket = true
tandem.currentNumberOfPassenger = 2
tandem.currentSpeed = 22
print("Тандем \(tandem.description)")

/// Переопределенее  - override

class Train: Venicle {
    override func makeNoise() { // override
        print("Чух-чух")
    }
}

let train = Train()
train.makeNoise()

class Car: Venicle {
    var gear = 1
    override var description: String {
        return super.description + " на \(gear)й передаче " // super.description - обращаемся к свойству нашего super class
    }
}

let car = Car()
car.currentSpeed = 25
car.gear = 3
print("Машина \(car.description)")


final class AutomaticCar: Car { // final - запрещает наследованее
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35
print("Автоматическа машина \(automaticCar.description)")
