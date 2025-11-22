import Foundation

func fibonacciNumber(n: Int) -> Int {
    if n < 0 {
        fatalError("Negative input not allowed")
    } else if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        var a = 0
        var b = 1
        for _ in 2...n {
            let temp = a + b
            a = b
            b = temp
        }
        return b
    }
}

func fibonacciSeries(n: Int) -> [Int] {
    var series: [Int] = []
    for i in 0..<n {
        series.append(fibonacciNumber(n: i))
    }
    return series
}

func padding(_ array: [Int]) -> [String] {
    var result: [String] = []
    for i in 0..<array.count {
        let number = array[i]
        let stringifiedNumber = String(number)
        let printableTotalNumber = String(repeating: " ", count: 2 - stringifiedNumber.count).appending(stringifiedNumber)
        result.append(printableTotalNumber)
    }
    return result
}

func fetchN() -> Int {
    let firstArgument: String? = CommandLine.arguments[1]

    if let n = Int(firstArgument!) {
        return n
    } else {
        fatalError("Invalid n.")
    }
}

func main() {
    let n: Int = fetchN()
    let totalNumbers: [Int] = [Int](0..<n)
    let fibonacciNumbers = fibonacciSeries(n: n)

    let resultA: [String] = padding(totalNumbers)
    let resultB: [String] = padding(fibonacciNumbers)

    print(resultA)
    print(resultB)
}

main()
