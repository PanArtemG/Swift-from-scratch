import UIKit


func printTitle(title: String) {
    print("""
        
        ---------------- \(title) ----------------
        
        """)
}

///------------------------------------------
printTitle(title: "Инициализация")
///------------------------------------------

struct Fahrengeit {
    var temperature = 32.0
}

var f = Fahrengeit()
print("Temp fahrengeit: \(f.temperature)")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrengeit fahrengeit: Double) {
        temperatureInCelsius = (fahrengeit - 32) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}


let boilingPointOfWater = Celsius(fromFahrengeit: 212.0)
boilingPointOfWater.temperatureInCelsius

let freexPointWater = Celsius(fromKelvin: 273.15)
freexPointWater.temperatureInCelsius

let bodyTemp = Celsius(36.6)
bodyTemp.temperatureInCelsius

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

var magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let grey = Color(white: 0.5)

///------------------------------------------
printTitle(title: "Optional type props")
///------------------------------------------

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheesQuestion = SurveyQuestion(text: "You like cheess?")
cheesQuestion.ask()

cheesQuestion.response = "I like cheese"

///------------------------------------------
printTitle(title: "Default init")
///------------------------------------------

class ShopListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShopListItem()

struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2, height: 2)
twoByTwo.height

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}                                   //let basicRect = Rect()
    init(origin: Point, size: Size) {           //let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {           // let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0)) // init(origin: Point, size: Size)
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0)) // init(center: Point, size: Size)
let basicRect = Rect()                                                                    // init() {}

///------------------------------------------
printTitle(title: "inheritance and initial classes")
///------------------------------------------

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) колес(а)"
    }
}
let venichle = Vehicle()

print(venichle.description)

class Bicycle: Vehicle {
    override init() { // override - перезапись
        super.init() // обоаженияк дефолтному инициализатору родительского класса
        numberOfWheels = 2
    }
}

let bicycles = Bicycle()
print("Велосипед имеет \(bicycles.description)")

///------------------------------------------
printTitle(title: "Auto inheritance")
///------------------------------------------

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() { // вспомогательный
        self.init(name: "[Без названия]") // вызываем и передаем
    }
}

let namedMeat = Food(name: "Бекон")
namedMeat.name //"Бекон"

let mysteryMeat = Food()
mysteryMeat.name //"[Без названия]"

class Ingridient: Food {
    var quantity: Int
    init (name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}


let oneMysteryItem = Ingridient()
oneMysteryItem.name
let oneBacon = Ingridient(name: "Bacon")
oneBacon.name
oneBacon.quantity
let sixEggs = Ingridient(name: "Egg", quantity: 6)
sixEggs.name
sixEggs.quantity


class ShopingListItem: Ingridient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔︎" : " ✘"
        return output
    }
}

var breakfastList = [
    ShopingListItem(),
    ShopingListItem(name: "Beacon"),
    ShopingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Juce"
breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}


///------------------------------------------
printTitle(title: "Проваливающиеся инициализатор")
///------------------------------------------

let mayBeNumber = "123"

if let number = Int(mayBeNumber) {
    print("It's number \(number)")
} else {
    print("Not a number \(mayBeNumber)")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {return nil}
        self.species = species
    }
}

let someCreature = Animal(species: "Lion")

if let lion = someCreature {
    print("Animal: \(lion.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("Not a animal")
}

if let anonymous = anonymousCreature {
    print("Animal: \(anonymous.species)")
} else {
    print("Not a animal")
}

///------------------------------------------
printTitle(title: "Проваливающиеся инициализатор for enums")
///------------------------------------------


//enum TemperatureUnit {
//    case kelvin, celsius, fahrengeit
//    init?(symbol: Character) {
//        switch symbol {
//        case "K":
//            self = .kelvin
//        case "C":
//            self = .celsius
//        case "F":
//            self = .fahrengeit
//        default:
//            return nil
//        }
//    }
//}

enum TemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrengeit = "F"
    
}

//let fahr = TemperatureUnit(symbol: "F")
let fahr = TemperatureUnit(rawValue: "F")
if fahr != nil {
    print("OK")
}

//let uncnownUnit = TemperatureUnit(symbol: "x")
let uncnownUnit = TemperatureUnit(rawValue: "x")
if uncnownUnit == nil {
    print("No")
}

///------------------------------------------
        printTitle(title: "Распростанение проваливающиеся инициализатор")
///------------------------------------------

class Product {
    let name: String
    init? (name: String){
        if name.isEmpty {return nil}
        self.name = name
    }
}

class CartIrem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {return nil}
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartIrem(name: "socs", quantity: 2) {
    print("Вещь: \(twoSocks.name) куплена \(twoSocks.quantity)шт..")
}

if let zeroShirts = CartIrem(name: "Shirts", quantity: 0) { // ПРОВАЛ ИНИЦИАЛИЗАЦИИ из-за количества 0
    print("Вещь: \(zeroShirts.name) куплена \(zeroShirts.quantity)шт..")
} else {
    print("Вещь:  ERROR")
}


///------------------------------------------
        printTitle(title: "Переопределение проваливающиеся инициализатор")
///------------------------------------------

class Document {
    var name: String?
    init(){}
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {               //переопределение чего - обычного инициализатора  init()
        super.init()                // вызов родительского
        self.name = "[Untitled]"    // определяем свойства
    }
    override init(name: String) {   // переопределяем чего - переопределяем  init?(name: String)
        super.init()                // вызов родительского
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
 

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")! // не провалится
    }
}


///------------------------------------------
        printTitle(title: "Требуемый инициализатор")
///------------------------------------------
// ЧТО БЫ КАЖДЫЙ КЛАС БЫЛ ОБЯЗАН ПЕРЕОПРЕДИЛИТЬ ИНИЦИАЛИЗАТОР


class SomeClass {
    required init() {
        //
    }
}

class SomeSubClass: SomeClass {
//    var name: String = "" если есть дефолт переопределять не нужно
    var name: String
    init(name: String) {
        self.name = name
    }
    required init() {
        self.name = "XXX"
    }
}

///------------------------------------------
        printTitle(title: "Начальное значение свойства в виде функции")
///------------------------------------------
/*
class SomeNewClass {
    let someProp: SomeType = {
        // пишем функцию которая определяет SomeValue и возвращает его
        return SomeValue
    }()
}
*/

struct ChessBoard {
    let boardColors: [Bool] = {
       var tempBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                tempBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return tempBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = ChessBoard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 1, column: 1))

///------------------------------------------
        printTitle(title: "Начальное значение свойства в виде функции")
///------------------------------------------
/// Вызывается сразу после освобождение екзкмпляра класса - deInit (только для class)

class Bank {
    static var coinsInBank = 10_000
    static func distibute(coins numberOfCoinsRequsted: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequsted, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distibute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distibute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("New player begin game wis \(playerOne!.coinsInPurse) coins")
print("Now in bank \(Bank.coinsInBank) coins")

playerOne = nil
print("New player game over")
print("Now in bank \(Bank.coinsInBank) coins")
