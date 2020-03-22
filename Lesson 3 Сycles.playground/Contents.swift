import UIKit

//!!! for in

var names = ["Anna", "Alex", "Brain", "Jack"]
for name in names {
    print("Hi, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


for ind in 1...5 {
//    print("\(ind) умножить на 5 будет \(ind * 5) ")
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}
//print(answer)


//!!! Полузвскнутый диапазон // Итерации с интервалами
let minutes = 60

for ticMark in 0..<minutes {
    
}

let minutInterval = 5
// func stride(from: 0, to: minutes, by: minutInterval) задает нужный интервал и шаг перебора
for ticMark in stride(from: 0, to: minutes, by: minutInterval) {
print(ticMark) // без 60
}


let hours = 12
let hourInterval = 3
for tickMark in stride(from: 0, through: hours, by: hourInterval) { // замкнутый диапазон
    print(tickMark)
}

//!!! WHILE (whille & repeat while)

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[3] = 8; board[6] = 11; board[9] = 9; board[10] = 2
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8

var squre = 0
var diceRoll = 0

while squre < finalSquare {
    // бросок кубика
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // делаем ход дальше
    squre += diceRoll
    if squre < board.count { squre += board[squre] }
}
print("Game over")

// repeat while

squre = 0
diceRoll = 0

repeat {
    squre += board[squre]
    // бросок кубика
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // делаем ход дальше
    squre += diceRoll
} while squre < finalSquare

print("Game over")
