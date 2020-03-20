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

var simbol = "\'Special\' \t \"simbol\" \\ \n new string"
/*
         \ - экран для вывода символов
         \n - new string
         \t - tab
 */

var dollarSign = "\u{24}"
var emoji = "\u{1F498}"
print(emoji)

