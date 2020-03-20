import UIKit

//!!!  Int // Double // Float
let minValUInt8 = UInt8.min
let maxValUint8 = UInt8.max
let int: Int


let decimalInt = 42
let binaryInt = 0b10001
let octainInt = 0o21
let hexInt = 0x11

let decimalDouble = 12.1875
let expDouble = 1.21875e1
let hexDouble = 0xc.3p0

let oneMilion = 1_000_000


let double: Double = 0.0000000 // 5 после точки
let numDouble = 3.12345

let float: Float = 0.0000000 // 16 после точки

//!!! Преобразование типов

//let cannootBeNegative: UInt8 = -1

let twoThousend: UInt16 = 2000
let one: UInt8 = 1
let twoThousendOne = twoThousend + UInt16(one)

let three = 3
let pointOneFourOneFive = 0.14159
let numberPi = Double(three) + pointOneFourOneFive

//!!! Псевдонимы типов - это альтернативное название типов

typealias AudioSample = UInt16

let maxValAS = AudioSample.max

// Bollean type

let isHide = true
let isHideBool: Bool = true

//!!! Кортежи - несколько значений в одной единицы памяти

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
// Varibal
print("Code status: \(statusCode)")
print("Status message: \(statusMessage)")
//Index
print("Code status: \(http404Error.0)")
print("Status message: \(http404Error.1)")

let http200Status = (statuscode: 200, description: "Ok")
//Key
print("Code status: \(http200Status.statuscode)")
print("Status message: \(http200Status.description)")
print("HTTP 200: \(http200Status.self)")

//!!! Инструкции IF

//!!! Опционалы
// могут принимать значенее указаного типа или вообще не иметь значения

var a: Int? // ? - Опциональная переменная

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber содержит некоторое значение: \(convertedNumber!) ") // ! - извлекаем значение
}

// Нужно использовать следующую запись
if let actualNumber = convertedNumber {
    print("actualNumber содержит некоторое значение: \(actualNumber) ")
}

// Опциональные привязки и логические условия

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 { // Делаем 3 привязки (все должны выполнится)
    print("\(firstNumber) < \(secondNumber) < 100 ")
}

// Неявно извлеченные опционалы / Implicitly recovered Optional

var str: String! // = nill !! это значит что в момент обращение к переменной в ней гарантировано должно быть значение - !nil

// пример 1 - явно извлеченный опционал
let possibleString: String? = "Optional string"
let firstString: String = possibleString!

// пример 2 - неявно извлеченный опционал
var assumedString: String!
assumedString = "Implicitly recovered Optional"
let implicitlyString = assumedString
