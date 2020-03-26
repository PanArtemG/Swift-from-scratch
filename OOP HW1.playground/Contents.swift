import UIKit


//Задание 1
//Вычисляемые свойства:
//Сделать структуру Circle. В ней будет 2 свойства радиус и площадь. Площадь должна рассчитываться автоматически. При изменении площади радиус должен перерассчитываться.


struct Circle {
    var pi: Float = 3.1415
    var radius: Float
    var area: Float {
        get {
            return pi * pow(radius, 2)
        }
    }
}

var circle = Circle(radius: 5)
circle.area
circle.pi = 10
circle.area
