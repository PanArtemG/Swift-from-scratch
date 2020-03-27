import UIKit

func printTitle(title: String) {
    print("""
        
        ---------------- \(title) ----------------
        
        """)
}

///------------------------------------------
printTitle(title: "Цикл сильных ссылок")
///------------------------------------------

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment? // звязь - сильная ссылка с Apartment
    deinit {
        print("\(name) deinit")
    }
}

class Apartment {
    var unit: String
    init(unit: String) {
        self.unit = unit
    }
    //    var tenant: Person? // звязь - сильная ссылка с Person
    weak var tenant: Person? // слабая ссылка
    deinit {
        print("Apartment \(unit) deinit")
    }
}

var john: Person?
var unit64: Apartment?

john = Person(name: "John Appleseed")
unit64 = Apartment(unit: "4a")

john?.apartment = unit64
unit64?.tenant = john

/// deinit не произойдет
//    var tenant: Person? // звязь - сильная ссылка с Person
//john = nil

//var apartment: Apartment? // звязь - сильная ссылка с Apartment
//unit64 = nil

///------------------------------------------
printTitle(title: "Замена циклов ссылок между екзкмплярами (weak)")
///------------------------------------------

// weak var tenant: Person? // слабая ссылка
//john = nil   // deinit
//unit64 = nil // deinit

///------------------------------------------
printTitle(title: "Безхосные ссылки не имеют сильных связей (unowned)")
///------------------------------------------

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) DEINIT")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card \(number) DEINIT")
    }
}

var johnA: Customer?

johnA = Customer(name: "John Applesed")
johnA?.card = CreditCard(number: 1234_5678_9012_3456, customer: johnA!)

//johnA = nil //John Applesed DEINIT // Card 1234567890123456 DEINIT/

///------------------------------------------
printTitle(title: "Безхосные ссылки не имеют сильных связей (unowned)")
///------------------------------------------

class Country {
    let name: String
    var capitaliCity: City!
    init(name: String, capitaliCity: String) {
        self.name = name
        self.capitaliCity = City(name: capitaliCity, country: self)
    }
    deinit {
        print("Country \(name) DEINIT")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City \(name) DEINIT")
    }
}

var country = Country(name: "Ukraine", capitaliCity: "Kiev")
print("Capital of \(country.name) is \(country.capitaliCity.name)")

///------------------------------------------
printTitle(title: "Циклы сильных ссылки для замыканий")
///------------------------------------------

class HTMLElement {
    let name: String
    let text: String?
    
//     lazy var asHTML: () -> String = {
    lazy var asHTML: () -> String = { [unowned self] in // все self  будут безхозными
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "</\(self.name)>"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) DEINIT")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"

heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello world")
print(paragraph!.asHTML())

//lazy var asHTML: () -> String = {
//paragraph = nil // не получилось

//lazy var asHTML: () -> String = { [unowned self] in
paragraph = nil // p DEINIT

///------------------------------------------
printTitle(title: "Опциональная цепочка")
///------------------------------------------
