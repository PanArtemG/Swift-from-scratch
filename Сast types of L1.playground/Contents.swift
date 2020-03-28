import UIKit

func printTitle(title: String) {
    print("""

    ---------------- \(title) ----------------

    """)
}

///
            printTitle(title: "Приведение типов / Cast type of")
///

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Movie1", director: "Director1"),
    Song(name: "Song1", artist: "Artist1"),
    Movie(name: "Movie2", director: "Director2"),
    Song(name: "Song2", artist: "Artist2"),
    Song(name: "Song3", artist: "Artist3")
]

    /// is -                - оператопр приведения типа class
    /// as? | as!       - оператопр понижающего приведения типа class

var countMovie = 0
var countSong = 0

for item in library {
    if item is Movie {
        countMovie += 1
    } else if item is Song {
        countSong += 1
    }
}

print("Songs: \(countSong). Movies: \(countMovie)")


for item in library {
    if let movie = item as? Movie {
        print("Film: \(movie.name), director: \(movie.director)")
    } else if let song = item as? Song {
         print("Song: \(song.name), artist: \(song.artist)")
    }
}

///
        printTitle(title: "Псевдонимы типа (Any | Any Object)")
///


var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael


let optionalValue: Int? = 3

things.append(optionalValue as Any)

///
        printTitle(title: "Вложеные типы")
///


struct BlackJackCard {
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }
    
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "масть - \(suit.rawValue),"
        output += " значение - \(rank.values.first)"
        if let secondVal = rank.values.second {
            output +=  " или \(secondVal)"
        }
        return output
    }
}

let theAceOfSpades = BlackJackCard(rank: .ace, suit: .spades)
print(theAceOfSpades.description) // масть - ♠️, значение - 1 или 11

let theSixOfDiamon = BlackJackCard(rank: .six, suit: .diamonds)
print(theSixOfDiamon.description) // масть - ♦️, значение - 6


let heartsSymbol = BlackJackCard.Suit.hearts.rawValue // "♥️"
