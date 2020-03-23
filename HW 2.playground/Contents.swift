import UIKit


//Задания по теме Основы Swift. Управление потоком:

//Задание 1
//Каждый год урожайность повышается на 5%. Написать алгоритм, который рассчитает через сколько лет урожай удвоится?


let harvestCurrent: Double = 100
let growthPercent: Double = 5
let harvestDoubleValue: Double = harvestCurrent * Double(2)
var growtnHarvest = harvestCurrent
var year = 0

while !(growtnHarvest >= harvestDoubleValue) {
    growtnHarvest += growtnHarvest / Double(100) * growthPercent
    year += 1
}

print("Need \(year) years")


//Задание 2
//Вывести на экран все простые числа до заданного.

let userNumber = 2

func prime(_ number: Int) -> Bool {
    return (1...number).filter({number % $0 == 0}).count <= 2
}


for num in 2...userNumber {
    if prime(num) {
        print(num)
    }
}

//Задание 3
//Определить, является введенное слово «перевертышем» (потоп, казак). Вывести словесный ответ.

let word = "потоп"
var anotherWord = ""
var indexLeter = word.count - 1

for _ in word {
    let index = word.index(word.startIndex, offsetBy: indexLeter)
    anotherWord += String(word[index])
    indexLeter -= 1
}
if word == anotherWord {
    print("Слово является «перевертышем»")
} else {
    print("Слово НЕ является «перевертышем»")
}

//Задание 4
//Дана строка, состоящая из открывающихся и закрывающихся круглых скобок в произвольной последовательности. Проверить правильность написания круглых скобок, чтобы каждая открывающаяся скобка была закрыта.

let bracketString = "(.)(.)"
var bracketOpen = 0
var bracketCloset = 0

for bracket in bracketString {
    if bracket == "(" {
        bracketOpen += 1
    } else if  bracket == ")" {
        bracketCloset += 1
    } else {
        continue
    }
}

let bracketResult: () = bracketOpen == bracketCloset ? print("Cо скобками все ОК") : print("У вас не порядок со скобками")
print(bracketResult)


//Задание 5
//Дана строка, состоящая из открывающихся и закрывающихся круглых скобок, квадратных и фигурных в произвольной последовательности. Проверить правильность написания скобок, чтобы каждая открывающаяся скобка была закрыта соответствующим типом закрывающейся скобки.

