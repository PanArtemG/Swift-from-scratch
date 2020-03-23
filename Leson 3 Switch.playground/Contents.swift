import UIKit

let someChar: Character = "f"

switch someChar {
case "a":
    print("First leter")
case "z":
    print("Last leter")
default:
    print("Another leter")
}

// Составной диапазон
let yearOld = 17

switch yearOld {
case 0..<7:
    print("Children")
case 7..<17:
    print("Learner")
case 17..<22:
    print("Stydent")
default:
    print("Worker")
}

let somePoint = (1, 3)
switch somePoint {
case (0, 0):
    print("\(somePoint) в начале координат")
case (_, 0):
    print("\(somePoint) лежит на оси Х")
case (0, _):
    print("\(somePoint) лежит на оси У")
case (-2...2, -2...2):
    print("\(somePoint) лежит внутри области")
default:
    print("За пределами области")
}


// Привязка значений

let anotherPoint = (2, 2)

switch anotherPoint {
case (let x, 0):
    print("Лежит на оси Х и значение Х = \(x)")
case (0, let y):
    print("Лежит на оси Х и значение Y = \(y)")
case (let x, let y):
    print("Лежит где то еще (\(x), \(y))")
}

//

let yetAnotherPoint = (1, 2)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) лежит на прямой х = у ")
case let (x, y) where x == -y:
    print("(\(x), \(y)) лежит на прямой х = -у ")
case (let x, let y):
    print("Лежит где то еще (\(x), \(y))")
}

// Составные кейсы

let someCharacter: Character = "3"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("Гласная буква \(someCharacter)")
case "b", "c", "d", "f", "g":
    print("Согласная буква \(someCharacter)")
default:
    print("Это не буква")
}

let stillAnotherPoint = (1, 7)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("Лежит на одной из оси от начала координат \(distance)")
default:
    print("Лежит где то еще")
}

// Continue


let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for char in puzzleInput {
    if charToRemove.contains(char) {
        continue // если условие выболнилось continue дает команду приступить к следующей итерации
    }
    puzzleOutput.append(char)
}
print(puzzleOutput)

//!!! Break

let numderSymbol: Character = "3"
var possibleInt: Int?

switch numderSymbol {
case "1":
    possibleInt = 1
case "2":
    possibleInt = 2
case "3":
    possibleInt = 3
case "4":
    possibleInt = 4
default:
    break
}

if let intVal = possibleInt {
    print(intVal)
} else {
    print("NOT FOUND")
}

//!!! fallthrough - позволяет перейти в следующий кейс не проверяя условия

let intToDescribe = 5
var desription = "The number \(intToDescribe) is"

switch intToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    desription += " a prime number, and also"
    fallthrough
default:
    desription += " a integer"
}

print(desription)

// !!! Маркированнные инструкции

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[3] = 8; board[6] = 11; board[9] = 9; board[10] = 2
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8

var squre = 0
var diceRoll = 0

gameLoop: while true { // gameLoop: маркер цикла
    // бросок кубика
    diceRoll += 1
    print("Бросок кубика: \(diceRoll)")
    if diceRoll == 7 { diceRoll = 1 }
    // делаем ход дальше
    switch squre + diceRoll {
    case finalSquare:
        break gameLoop // break gameLoop - прерываем цикл по маркеру
    case let newSquare where newSquare > finalSquare:
        print("New square: \(newSquare)")
        continue gameLoop
    default:
        squre += diceRoll
        print("Куда ходим : \(squre)")
        squre += board[squre]
        print("Где оказываемся : \(squre)")
    }
}
print("Game over")


//!!! GUARD - ранний выход

func great (person: [String: String]) {
    
    guard let name = person["name"] else { return }
    
    print("Привет, \(name)")
    
    guard let location = person["location"] else {
        print("Надеюсь у тебя все хорошо!")
        return
    }
    
    print("Надеюсь в \(location) хорошая погода")
}

great(person: ["name": "Jon", "location": "Kiev"])
