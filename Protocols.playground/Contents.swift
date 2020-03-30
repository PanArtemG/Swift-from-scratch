import UIKit
import Foundation

//protocol SomeProtocol {
//    static func someTypeMethod()
//}


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 129968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator1 = LinearCongruentialGenerator()

print("Random number: \(generator1.random())")
print("Random number 2: \(generator1.random())")


print("--------------------------\"Требования изменяющих методов\"--------------------------")

protocol Toggable {
    mutating func toggle() // mutating только для enum & struct
}

enum OnOffSwitch: Toggable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}


var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch.toggle()

print("--------------------------\"Требования инициализатора\"--------------------------")

protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        //
    }
}

//class SomeSubClass: SomeProtocol {
//    required init() {  // protocol SomeProtocol
//        //
//    }
//}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    required override init() { // protocol SomeProtocol & class SomeSuperClass
        //
    }
}

print("--------------------------\"Протоколы как типы\"--------------------------")


class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Бросок кубика: \(d6.roll())")
}

print("--------------------------\"Делегирование\"--------------------------")

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfturns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfturns = 0
        if game is SnakesAndLadders {
            print("Get start new game: Snakes & Ladders")
        }
        print("У игральной кости \(game.dice.sides) сторон")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfturns += 1
        print("Number of dice roll: \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("Длительность игры: \(numberOfturns) ходов")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

print("--------------------------\"Добавление реализации протокола\"--------------------------")

protocol TextRepresentable {
    func textualDescription() -> String
}

extension Dice: TextRepresentable {
    func textualDescription() -> String {
        return "Игральная кость с \(sides) гранями"
    }
}


let d10 = Dice(sides: 10, generator: LinearCongruentialGenerator())
print(d10.textualDescription())

extension SnakesAndLadders: TextRepresentable {
    func textualDescription() -> String {
        return "Игра  Snakes & Ladders с полем в \(finalSquare) клеток"
    }
}

print(game.textualDescription())

// через пустое расширение

struct Hamster {
    var name: String
    func textualDescription() -> String {
        return "Хомяка назвали \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepres: TextRepresentable = simonTheHamster
print(somethingTextRepres.textualDescription())


print("--------------------------\"Коллекция типов и наследование протоколов\"--------------------------")

let things: [TextRepresentable] = [game, d10, simonTheHamster]
for thing in things {
    print(thing.textualDescription())
}


protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription() + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)


print("--------------------------\"Классовые протоколы и композиции\"--------------------------")

// граничить использование только для классов
protocol SomeProto: AnyObject {
    //
}

protocol SomeProto2: class {
    //
}

// композиция протоколов
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct VipPerson: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirhday(to celebrator: Named & Aged) { // композиция протоколов
    print("Happy Birhday, \(celebrator.name)! You age \(celebrator.age)")
}

let birhdayPerson = VipPerson(name: "Saha", age: 21)
wishHappyBirhday(to: birhdayPerson)



class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}
 
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)
// Выведет "Hello, Seattle!"

print("--------------------------\"Проверка соответсвию протокола\"--------------------------")

protocol HasArea {
    var area: Double {get}
    
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}


class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243610),
    Animal(legs: 4) ]


for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Площадь ровна \(objectWithArea.area)")
    } else {
        print("Not a HasArea")
    }
}

print("--------------------------\"Опциональные требования протокола\"--------------------------")



@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowwardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowwardsZeroSource()

for _ in 1...5 {
    counter.increment()
     print(counter.count)
}

print("--------------------------\"Расширения протокола\"--------------------------")

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generatorBool = LinearCongruentialGenerator()
print("Рандомное число: \(generatorBool.random())")
print("Рандомное BOOL: \(generatorBool.randomBool())")

extension PrettyTextRepresentable {
    var prettyTextelDescription: String {
        return textualDescription()
    }
}

extension Collection where Iterator.Element: TextRepresentable {
    func textualDescription() -> String {
        let itemAsText = self.map { $0.textualDescription() }
        return "[" + itemAsText.joined(separator: ", ") + "]"
    }
}


let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgsn")
let mayrisTheHamster = Hamster(name: "Mayris")
let hamsters = [murrayTheHamster, morganTheHamster, mayrisTheHamster]

print(hamsters.textualDescription())
