import UIKit



func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {return nil}
    
    var minVal = array[0]
    var maxVal = array[0]
    
    for value in array[1..<array.count] {
        if value < minVal {
            minVal = value
        } else if value > maxVal {
            maxVal = value
        }
    }
    return (minVal, maxVal)
}

if let bounds = minMax(array: [8, -4, 3, 104, 7, 67]){
    print("Min = \(bounds.min); Max = \(bounds.max)")
} else {
    print("Array is empty")
}

///

func greet(person: String, from hometown: String) -> String { // from hometown: - параметр from c ярлыком hometown // greet(person: <#T##String#>, from: <#T##String#>)
    return "Hello \(person), from \(hometown)"
}

func greetPerson( _ person: String ) -> String {
    return "Hello \(person)"
}

greetPerson("Ales")

func multiply(a: Int, b: Int = 5) -> Int { // b: Int = 5 - default value
    return a * b
}

multiply(a: 5, b: 6)
multiply(a: 5)

// Вариативные параметры print(<#T##items: Any...##Any#>)  в фнкции может только один такой параметр

func arithmeticMean( _ numbers: Double...) -> Double {
    var total: Double = 0
    for num in numbers {
        total += num
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)


// Сквозные параметры (v)
    
func swapTwoInts( _ a: inout Int, _ b: inout Int ) {
    let A = a
    a = b
    b = A
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print(someInt, anotherInt)

// Функциональные типы
//(Int, Int) -> Int // - функциональный тип

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

//() -> Void // - функциональный тип (Void - функция не возвращает никакогго значения )
func printHellWorld() {
    print("Hello world")
}

var mathFunc: (Int, Int) -> Int = addTwoInts
//var mathFunc = addTwoInts

//print("Result: \(mathFunc(2, 3))")

///

func printResult (_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunc(a, b))")
}

//printResult(multiply(a:b:), 3, 5)

func chooseStepFunc(backward: Bool) -> (Int) -> Int {
    
    func stepForward(_ input: Int) -> Int { return input + 1 }
    
    func stepBackward(_ input: Int) -> Int { return input - 1 }
    
    return backward ? stepBackward : stepForward
}

var currenVal = -3
let moveNearToZero = chooseStepFunc(backward: currenVal > 0)
print("Отсчет до нуля...")

while currenVal != 0 {
    print("\(currenVal)...")
    currenVal = moveNearToZero(currenVal)
}
print("НОЛЬ!!!")


// Замыкание

let names = ["Chirs", "Alex", "Ewa", "Barry", "Daniela"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversNames = names.sorted(by: backward)
reversNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// Сокращенная форма
reversNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})
// Сокращенная форма
reversNames = names.sorted(by: { s1, s2 in s1 > s2 })

// Сокращенная форма
reversNames = names.sorted(by: { $0 > $1 })

// Сокращенная форма
reversNames = names.sorted(by: > )


print(reversNames)

// Последующее замыкание

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]


let numbers = [18, 63, 345]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
//        print(number)
//        print(number % 10)
//        print("digitNames[number % 10]! \(digitNames[number % 10]!)")
        number /= 10
    } while number > 0
    
    return output
}

print(strings)


/// Захват значения

func makeIncrementer(forIncrementer amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementerByTen = makeIncrementer(forIncrementer: 10)
incrementerByTen()
incrementerByTen()
incrementerByTen()
let incrementerBySeven = makeIncrementer(forIncrementer: 7)
incrementerBySeven()
incrementerBySeven()
incrementerBySeven()

// Сбегающие замыкание

var completionHandlers: [()->Void] = []

func someFunkWithEscaping(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunkWiyhout(closure: ()->Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunkWithEscaping {
            self.x = 100
        }
        someFunkWiyhout {
            x = 200
        }
    }
}

let instance = SomeClass()

instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// Автозамыкание
print("""

---------------- Автозамыкание ----------------

""")
var customersInLine = ["Chirs", "Alex", "Ewa", "Barry", "Daniela"]
print(customersInLine.count)


let custoerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now \(custoerProvider())")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now \(custoerProvider())")
}

serve(customer: { customersInLine.remove(at: 0)})

///

func serve(customer customirPrivider: @autoclosure () -> String) {
    print("Now \(custoerProvider())")
}

serve(customer: customersInLine.remove(at: 0))
print(customersInLine.count)
