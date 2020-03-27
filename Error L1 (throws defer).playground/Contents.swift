import UIKit

func printTitle(title: String) {
    print("""
        
        ---------------- \(title) ----------------
        
        """)
}

///------------------------------------------
            printTitle(title: "Error processing")
///------------------------------------------

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 0)
    ]
    var coinDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinDeposited  else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinDeposited)
        }
        
        coinDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Продано \(name) за \(newItem.price). Остаток: \(newItem.count)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachines: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachines.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinDeposited = 10

do {
    try buyFavoriteSnack(person: "Eve", vendingMachines: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Error selected")
} catch VendingMachineError.outOfStock {
    print("Not item in stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Need \(coinsNeeded)")
}

///------------------------------------------
            printTitle(title: "Сonversion error")
///------------------------------------------

func someThrow() throws -> Int {
    return 0
}

let x = try? someThrow()
// тоже самое как...
///-----------
let y: Int?
do {
    y = try someThrow()
} catch {
    y = nil
}
///-----------


//let photo = try! loadImage(apPath: "./Resourses/John.jpg")


///------------------------------------------
            printTitle(title: "Очистка (defer)")
///------------------------------------------

//В то время как guard используется для проверки объектов на nil, чтобы избежать возможного исключения — defer призван отложить выполнения кода, объявленного в defer до окончания выполнения текущего блока.

//func processFile(fileName: String) throws {
//    if exists(fileName) { // если файл есть
//        let file = opened(fileName)
//        defer {
//            close(file)
//        }
//    }
//}
