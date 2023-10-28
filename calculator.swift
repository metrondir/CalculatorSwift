import Foundation

enum CalculatorError: Error {
    case invalidInput
    case divisionByZero
}

var firstValue: Int? = 0
var secondValue: Int? = 1
var operation: String? = "/"

func add(_ numbers: (Int?, Int?)) throws -> Int {
    guard let x = numbers.0, let y = numbers.1 else {
        throw CalculatorError.invalidInput
    }
    return x + y
}

func subtract(_ numbers: (Int?, Int?)) throws -> Int {
    guard let x = numbers.0, let y = numbers.1 else {
        throw CalculatorError.invalidInput
    }
    return x - y
}

func divide(_ numbers: (Int?, Int?)) throws -> Int {
    guard let x = numbers.0, let y = numbers.1, y != 0 else {
        throw CalculatorError.divisionByZero
    }
    return x / y
}

func multiply(_ numbers: (Int?, Int?)) throws -> Int {
    guard let x = numbers.0, let y = numbers.1 else {
        throw CalculatorError.invalidInput
    }
    return x * y
}

if let operation = operation, let firstValue = firstValue, let secondValue = secondValue {
    do {
        switch operation {
        case "+":
            try print("The result is: \(try add((firstValue, secondValue)))")
        case "-":
            try print("The result is: \(try subtract((firstValue, secondValue)))")
        case "*":
            try print("The result is: \(try multiply((firstValue, secondValue)))")
        case "/":
            try print("The result is: \(try divide((firstValue, secondValue)))")
        default:
            print("Invalid operation")
        }
    } catch CalculatorError.invalidInput {
        print("Invalid type input")
    } catch CalculatorError.divisionByZero {
        print("Division by zero is not allowed")
    }
} else {
    print("Invalid input")
}

