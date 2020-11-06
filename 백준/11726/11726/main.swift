//
//  main.swift
//  11726
//
//  Created by Yoojin Park on 2020/11/06.
//

import Foundation

func tiling(n: Int) -> Int {
    
    var dp = [Int](repeating: 0, count: n+1)

    dp[0] = 1
    dp[1] = 1
    
    guard n != 1 else {
        return 1
    }
    
    for i in 2...n { // 맨앞에 '|'가 들어가는 경우: dp[i - 1] / '='이 들어가는 경우: dp[i - 2]
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
    }
    
    return dp[n]
}

var n = Int(readLine()!)!
print(tiling(n: n))
