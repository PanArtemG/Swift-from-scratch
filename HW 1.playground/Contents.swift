import UIKit

// Task 1
// Определить являются ли данное число R четным.

let r = 31

if r % 2 == 0 {
    print("Number R: \(r) - EVEN")
} else {
    print("Number R: \(r) - ODD")
}

// Task 2
// Даны положительные целые числа A, B, C. Выяснить существует ли триугольник с длинами сторон A, B, C

let a = 12
let b = 23
let c = 19

(a < b + c && b < a + c && c < a + b) ?  print ("Triangle exists") : print ("Triangle does not exist")


// Task 3
// Дан массив из 10 целых чисел. Найти произведение положительных. А так же сумму и количество отрицательных чисел
let arr: [Int] = [1, -2, 3, -14, 5, -6, 7, 8, 9, -10]
var t = 1
var numbNegativeNmbers = 0
var sumNegativeNumbers = 0


for num in arr {
    if num > 0 {
        t = t * num
    } else if num < 0 {
        sumNegativeNumbers += 1
        numbNegativeNmbers +=  num
    } else if num == 0 {
        continue
    }
}
print("Произведение положительных: \(t)")
print("numbNegativeNmbers: \(numbNegativeNmbers)")
print("sumNegativeNumbers: \(sumNegativeNumbers)")

// Task 4
// Из N целых чисел в массиве, найти минимальное


if !arr.isEmpty && (type (of: arr[0]) == Int.self) {
    var minNumber = arr[0]
    for num in arr {
        if minNumber > num {
            minNumber = num
        }
    }
    print("minNumber: \(minNumber)")
}
