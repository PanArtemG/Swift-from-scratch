import UIKit
/*
Задания по теме ООП в Swift. Инициализация.

Задание 1
Построить три класса (базовый и 2 потомка), описывающих некоторых работников с почасовой оплатой (один из потомков) и фиксированной оплатой (второй потомок). Описать в базовом классе свойство name и метод для расчета среднемесячной заработной платы, который возвращает 0. Для «повременщиков» формула для расчета такова: «среднемесячная заработная плата = 20.8 * 8 * почасовую ставку», для работников с фиксированной оплатой «среднемесячная заработная плата = фиксированной месячной оплате». В классах потомках сделать инициализатор имени и ставки. А из инициализатора из родительского класса сделать вспомогательный инициализатор. В случае инициализации с помощью вспомогательного инициализатора часовую ставку сделать = 1000, а фиксированную ставку = 50_000.
*/

class Employee {
    var name: String
    func averageMonthlySalary(rate: Float) -> Float {
        return 0
    }
    init(name: String) {
        self.name = name
    }
}

class HourlyRateEmployee: Employee {
    var hourlyRate: Float
    override func averageMonthlySalary(rate: Float) -> Float {
        hourlyRate = 20.8 * 8 * rate
        return hourlyRate
    }
    init(name: String, rate: Float){
        hourlyRate = rate
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, rate: 1000)
    }
}

class FixedRateEmployee: Employee {
    var fixedRate: Float
    override func averageMonthlySalary(rate: Float) -> Float {
        fixedRate = rate
        return fixedRate
    }

    init(name: String, rate: Float){
        fixedRate = rate
        super.init(name: name)
    }

    override convenience init(name: String) {
        self.init(name: name, rate: 50_000)
    }
}


let empoloyee = Employee(name: "Вася")
print("TEST \(empoloyee.averageMonthlySalary(rate: 1212))")


let employeeRate = HourlyRateEmployee(name: "Саша")
employeeRate.hourlyRate
employeeRate.averageMonthlySalary(rate: 100)
employeeRate.hourlyRate

let employeeFix = FixedRateEmployee(name: "Коля")
employeeFix.name
employeeFix.fixedRate
employeeFix.averageMonthlySalary(rate: 100_000)
employeeFix.fixedRate

let employeeFix1 = FixedRateEmployee(name: "Володя", rate: 200000)
employeeFix1.name
employeeFix1.fixedRate
employeeFix1.averageMonthlySalary(rate: 100_000)
employeeFix1.fixedRate
employeeFix1.averageMonthlySalary(rate: 600_000)
employeeFix1.fixedRate = 700
employeeFix1.fixedRate
employeeFix1.averageMonthlySalary(rate: 600_111)
employeeFix1.fixedRate
