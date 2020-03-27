import UIKit

func printTitle(title: String) {
    print("""
        
        ---------------- \(title) ----------------
        
        """)
}

///------------------------------------------
            printTitle(title: "Доступ к свойствам")
///------------------------------------------


class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numderOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("Общее количество комнат: \(numderOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingId() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let john = Person()

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia road"
john.residence?.address = someAddress

func createAdrress() -> Address {
    print("Функция вызвана.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia road"

    return someAddress
}

john.residence?.address = createAdrress()

if john.residence?.printNumberOfRooms() != nil {
    print("Есть возможность вывести общее количество комнат")
} else {
    print("Нет возможности вывести общее количество комнат")
}

if john.residence?.address != nil {
    print("Была возможность установить адрес")
} else {
   print("Не было возможность установить адрес")
}


if let firstRoomName = john.residence?[0].name {
    print("Первая комната - \(firstRoomName)")
} else {
    print("Нет первой комнаты")
}


john.residence?[0] = Room(name: "Bedroom")


let johnHouse = Residence()
johnHouse.rooms.append(Room(name: "Гостинная"))


johnHouse.rooms.append(Room(name: "Citchen"))
john.residence = johnHouse

if let firstRoomName = john.residence?[0].name {
    print("Первая комната - \(firstRoomName)")
} else {
    print("Нет первой комнаты")
}
