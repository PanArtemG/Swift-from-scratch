import UIKit

func printTitle(title: String) {
    print("""

    ---------------- \(title) ----------------

    """)
}

///
        printTitle(title: "Class & Structure")
///

struct Resolution {
    var width = 0
    var hight = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, hight: 1080)
var cinema = hd

cinema.width = 2048

print("HD: \(hd.width)") // "HD: 1920"
print("Cinem: \(cinema.width)") //"Cinem: 2048"

enum CompasdPoint: String {
    case north // default val == north
    case south
    case east
    case west
}

var curDirect = CompasdPoint.west //west
let rememberDirection = curDirect //west
curDirect = .east //east


let tenEghty = VideoMode()

tenEghty.resolution = hd
tenEghty.interlaced = true
tenEghty.name = "1080i"
tenEghty.frameRate = 25.0

let alsoTenEghty = tenEghty

alsoTenEghty.frameRate = 30.0

print("Ten: \(tenEghty.frameRate)")

///
        printTitle(title: "properties")
///

struct FixedLengthRange {
    
    var firstValue: Int
    let lenght: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)

rangeOfThreeItems.firstValue = 6

// lazy properties

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()

manager.data.append("Что-то")
manager.data.append("Еще что-то")

print("Manager: \(manager.importer.fileName)") //lazy только сейчас инициализировалось

///
        printTitle(title: "calculated properties")
///

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point { // calculated properties
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
//        альтернативная форма записи
//        set() {
//            origin.x = newValue.x - size.width / 2
//            origin.y = newValue.y - size.height / 2
//        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 8.0))

let initialSquareCenter = square.center

square.center = Point(x: 7.0, y: 6.0)

print(square.origin)

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let cub = Cuboid(width: 4, height: 5, depth: 2)
print(cub.volume)

///
printTitle(title: "Наблюдатели свойст: willSet didSet")
///


class StepCounter {
    var totlaSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("Вот-вот значение будет равно: \(newTotalSteps)")
        }
        didSet {
            if totlaSteps > oldValue {
                print("Добавлено \(totlaSteps - oldValue) шагов")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totlaSteps = 200
stepCounter.totlaSteps = 350
stepCounter.totlaSteps = 180

///
    printTitle(title: "Свойства типа")
///

struct SomeStructure {
    static var storeTypeProperty = "Some value"
    static var computedTypePropertty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storeTypeProperty = "Some value"
    static var computedTypePropertty: Int {
        return 6
    }
}

class SomeClass {
    static var storeTypeProperty = "Some value"
    static var computedTypePropertty: Int {
        return 27
    }
    class var overrideableComputedTypePropertty: Int {
        return 107
    }
}

struct AudioChanel {
    static let threshouldLevel = 10
    static var maxInputLevelForAllChanel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChanel.threshouldLevel {
                currentLevel = AudioChanel.threshouldLevel
            }
            if currentLevel > AudioChanel.maxInputLevelForAllChanel {
                AudioChanel.maxInputLevelForAllChanel = currentLevel
            }
        }
    }
}

var leftChanel = AudioChanel()
var rightChanel = AudioChanel()

leftChanel.currentLevel = 7
print(leftChanel.currentLevel)
print(AudioChanel.maxInputLevelForAllChanel)

//leftChanel.currentLevel = 8
//print(leftChanel.currentLevel)
//print(AudioChanel.maxInputLevelForAllChanel)
//
//leftChanel.currentLevel = 6
//print(leftChanel.currentLevel)
//print(AudioChanel.maxInputLevelForAllChanel)

rightChanel.currentLevel = 11
print(rightChanel.currentLevel)
print(AudioChanel.maxInputLevelForAllChanel)

//rightChanel.currentLevel = 5
//print(rightChanel.currentLevel)
//print(AudioChanel.maxInputLevelForAllChanel)




