import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var answer = [String]()
    for i in 0..<n {
        var retArray = String(arr1[i] | arr2[i], radix: 2)
        print(retArray)
        retArray = retArray.replacingOccurrences(of: "1", with: "#")
        answer.append(String.init(repeating: " ", count: n - retArray.count) + retArray.replacingOccurrences(of: "0", with: " "))
    }
    return answer
}

print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))
