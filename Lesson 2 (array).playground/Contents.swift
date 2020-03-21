import UIKit



//var someInts: Array<Int>
//var someInts: [Int] = []
//var someInts= [1, 2, 5, 6]
var someInts =  [Int]()

someInts.append(3)
someInts.count


someInts = [] // clear array

var threeDoubles = Array(repeating: 0.0, count: 3) // [0, 0, 0]
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles // concat arrays

//!!! Сhanges array

var shoppingList = ["Eggs", "Milk"]
shoppingList.append("Apple")
shoppingList += ["Meat", "Orange", "Chokolad"]

// isEmpty return Bool
// .count return length

let firstItem = shoppingList[0]

shoppingList[0] = "Lime"

shoppingList[3...5] = ["Bannas", "Potate"] // replase range
shoppingList.insert("Water", at: 0) // replace element

let water = shoppingList.remove(at: 0)
let removeLast = shoppingList.removeLast()


//!!! Iterate over the array

//for item in shoppingList {
//    print(item)
//}

for (i, value) in shoppingList.enumerated() {
    print("\(i + 1). \(value)")
}

//!!! Sets

//var favorite = Set<String>()
//var favorite: Set<String> = []
var favorite: Set = ["Rock", "Classical"]

favorite.insert("Hip Hop")
favorite

favorite.count
favorite.isEmpty

favorite.insert("Jas")


// remove

if let removedItem = favorite.remove("Rock2") {
    print("Remove \(removedItem)")
} else {
    print("Not found")
}

if favorite.contains("Funk") {
    print("YES")
} else {
    print("NO")
}

for genre in favorite.sorted() { // return array
    print(genre)
}

let arrFavorite = favorite.sorted()

//!!! Operation at Sets


let oddDigits: Set = [1, 3, 5, 7, 9]
let singlePrimeDigits: Set = [2, 3, 5, 7]

// intersection - пересеченее (метод возвращает Set только из тех елементов которые есть в обеих множествах)
oddDigits.intersection(singlePrimeDigits) // {5, 3, 7}

// symmetricDifference - симетричная разность (метод возвращает Set только из тех елементов которые не повторяются в обеих множествах)
oddDigits.symmetricDifference(singlePrimeDigits) // {1, 9, 2}

// union - обьединение
oddDigits.union(singlePrimeDigits) // {9, 2, 1, 3, 5, 7}

// subtracting - разность(вычитание) c первого Set убираем все что есть во втором
oddDigits.subtracting(singlePrimeDigits) // {1, 9}

// isSubset и супермножества
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐶", "🐑", "🐱"]
let cityAnimals: Set = ["🐭", "🐦"]

houseAnimals.isSubset(of: farmAnimals) // true - isSubset является ли подмножеством
farmAnimals.isSuperset(of: houseAnimals) // true - isSuperset является ли родительским (в нем есть такие же елементы и другие)
farmAnimals.isDisjoint(with: cityAnimals) // true - isDisjoint не содержит ли таких же айтемов

//!! Dictionary

//let namesOfIntegers: Dictionary<Int, String>
//var airports: [String: String] = ["YYZ": "Toronto", "DUB": "Dublin"]

var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen" // add new element

namesOfIntegers = [:] // clear dictionary
var airports: [String: String] = ["YYZ": "Toronto", "DUB": "Dublin"]
airports["LHR"] = "London" // create ["LHR"] = "London"

airports["LHR"] = "London Heathrow" //chanche value ["LHR"] = "London"

// change val and return old val
if let oldVal = airports.updateValue("Duplin AIR", forKey: "DUB") {
    print(oldVal)
}

// remove element
airports["DUB"] = nil

airports

// Iteration in dictionary

for (key, val) in airports {
    print("\(key) \(val)")
}

// only keys
for key in airports.keys {
    print("\(key)")
}

// only val
for val in airports.values{
    print("\(val)")
}

//  create arr key dictionary
let airportCodes = [String](airports.keys)
airportCodes
