import Foundation


print("-------------------\"<T> - заполнитель имени типа\"-------------------")


func swapToValues<T>(_ a: inout T, _ b: inout T) { // <T> - заполнитель имени типа
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapToValues(&someInt, &anotherInt)
print(someInt)
print(anotherInt)
swap(&someInt, &anotherInt)


print("-------------------\"Параметр типа\"-------------------")

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    associatedtype Iterator: IteratorProtocol where Iterator.Element ==Item
    func makeIterator() -> Iterator
}


// не универсальная
struct IntStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
    func makeIterator() -> Array<Int>.Iterator {
        return Array<Int>.Iterator(_elements: items)
    }
}

// универсальная
struct Stack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
    func makeIterator() -> Array<Element>.Iterator {
        return Array<Element>.Iterator(_elements: items)
       }
}

extension Array: Container {}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings)  // stack содержит 4 строки


let fromTheTop = stackOfStrings.pop()
print(stackOfStrings)
print(fromTheTop)

print("-------------------\"Расширяем универсальный тип\"-------------------")

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print(topItem)
}

print("-------------------\"Ограничения тип\"-------------------")

//func someFunction<T: someClass, U: SomeProtocol>(someT: T, someU: U) {}
// не универсальная
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (ind, value) in array.enumerated() {
        if value == valueToFind {
            return ind
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("Index: \(foundIndex)")
}

// универсальная
func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
    for (ind, value) in array.enumerated() {
        if value == valueToFind {
            return ind
        }
    }
    return nil
}

let doubleIndex = findIndex(ofString: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex опциональный Int не имеющий значения, потому что значения 9.3 нет в массиве
let stringIndex = findIndex(ofString: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex опциональный Int равный 2

print("-------------------\"Связанные типы\"-------------------")

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}

print("-------------------\"WHERE\"-------------------")

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        // Проверяем одинаковое ли количество элементов находится в контейнерах.
        if someContainer.count != anotherContainer.count {
            return false
        }
        // Проверяем все ли значения попарно равны.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        // Все элементы совпадают, так что возвращаем true.
        return true
}

 
var arrayOfStrings = ["uno", "dos", "tres"]
 
if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

print("-------------------\"Расширения с оговоркой where\"-------------------")

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}


print("-------------------\"Связанные типы с универсальной оговоркой where\"-------------------")

protocol ComparableContainer: Container where Item: Comparable{}

extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
