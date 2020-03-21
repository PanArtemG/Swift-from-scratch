import UIKit

// Базовые операторы
// Составные операторы

(1, "zebra") < (2, "apple") // true сравнивает до первого true / false
(2, "zebra") < (2, "apple") // false
(2, "zebra") < (1, "apple") // false
(2, "apple") < (2, "zebra") // true


//nil

// a ?? b // if a == nil return b else return a

// Проверка на nil с извлечением опционала
let defaultColor = "red"
var userColor: String?

var color = userColor ?? defaultColor
print (color) // defaultColor: red


//!!! Многострочный литерал

var str = """
Строка без пробела
   4 пробела
Без пробела
"""
print(str)

//!!! Character

var simbol = "\'Special\' \t \"simbol\" \\ \n new string"
/*
         \ - экран для вывода символов
         \n - new string
         \t - tab
 */

var dollarSign = "\u{24}"
var emoji = "\u{1F498}"
print(emoji)


//!!! Empty string

var emptyStr = ""
var anotherEmptyStr = String()

if anotherEmptyStr.isEmpty {
    print("Empty")
}

/// Work at string

for character in "Dog! 🐶" {
    print(character)
}

let character: Character = "!" // type Character

let catCharacters: [Character] = ["C", "a", "t"]

let catStringOfArray = String(catCharacters) // string of array
print(catStringOfArray)


let str1 = "Hello "
let str2 = "World"
var welcome = str1 + str2

welcome += "!"

welcome.append(character)

let multiplayer = 3
let message = "\(multiplayer) timmes 2,5 is \(Double(multiplayer) * 2.5)"

//!!! Index of string

let greeting = "Guten Tag!"

greeting[greeting.startIndex] // G

greeting[greeting.index(before: greeting.endIndex)] // !

greeting[greeting.index(after: greeting.startIndex)] // u

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // 7 index = a

for i in greeting.indices { // greeting.indices  перебор по символьно
    print(greeting[i], terminator: " ") // Выводим одной строкой через пробел
}

var welcomeMes = "Hello"
welcomeMes.insert("!", at: welcomeMes.endIndex)

// append before last index
welcomeMes.insert(contentsOf: " ther", at: greeting.index(before: welcomeMes.endIndex))

// remove last ind
welcomeMes.remove(at: welcomeMes.index(before: welcomeMes.endIndex))


// range

let range = welcomeMes.index(welcomeMes.endIndex, offsetBy: -6)..<welcomeMes.endIndex // диапазон 6 символов сконца
welcomeMes.removeSubrange(range)

// substring // убираем диапазон от ","
let greeting2 = "Hello, world!"
let ind = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
let beginning = greeting2[..<ind]

//!!! compare string

let quotation = "Мы похожи"
let someQuotation = "Мы похожи"

if quotation == someQuotation {
    print("quotation == someQuotation")
}

quotation.hasPrefix("Мы") // true проверка на префикс
quotation.hasSuffix("похожи") // true проверка Suffix

//!! Unicode

//Utf8 8bit
//Utf16 - 16bit
//Utf32 32bit

let dogString = "Dog?!🐶"

dogString.count //6
for codeUinit in dogString.utf8 {
    print("\(codeUinit)", terminator: " ")
}
print()

for codeUinit in dogString.utf16 {
    print("\(codeUinit)", terminator: " ")
}
print()

for scalar in dogString.unicodeScalars {
    print("\(scalar.value)", terminator: " ")
}
print()
