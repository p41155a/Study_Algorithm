func solution(_ s:String) -> Int {
    let code = Array(s)
    var results: [String] = Array.init(repeating: "", count: code.count/2)
    // 자른 문자열의 배열
    
    if (s.count == 1) { // 문자열이 하나일 때
        return 1
    }
    
    for i in 0..<code.count/2 {
        let splitUnit = i + 1 // 자르는 단위
        var splitStrings: [String] = [] // 각 단위로 자른 문자열
        var n: Int = 1 // 문자열이 몇번 반복 되는지 담는 곳
        for j in 0..<code.count/splitUnit {
            splitStrings.append(String(code[(splitUnit*j)..<(splitUnit*(j+1))]))
            
            if j != 0  {
                let preSplitStr = splitStrings[j-1]
                let currentSplitStr = splitStrings[j]
                
                if preSplitStr == currentSplitStr { // 이전 것과 같을때
                    n += 1
                } else if n != 1 {
                    results[i] = "\(results[i])\(n)\(preSplitStr)"
                    n = 1
                } else {
                    results[i] = "\(results[i])\(preSplitStr)"
                }
                
                if j == code.count/splitUnit - 1 { // 마지막 일때만 도는 함수
                    let leftovers = String(code[(splitUnit*(j+1))..<code.count])
                    if n != 1 {
                        results[i] = "\(results[i])\(n)\(currentSplitStr)\(leftovers)"
                    } else {
                        results[i] = "\(results[i])\(currentSplitStr)\(leftovers)"
                    }
                }
            }
        }
    }

    return results.filter({$0 != ""}).min(by: {$0.count < $1.count})?.count ?? 0
}

print(solution("aabbaccc"))
print(solution("ababcdcdababcdcd"))
print(solution("abcabcdede"))
print(solution("abcabcabcabcdededededede"))
print(solution("xababcdcdababcdcd"))
