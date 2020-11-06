//
//  main.swift
//  1463
//
//  Created by Yoojin Park on 2020/11/05.
//

import Foundation

var num = Int(readLine()!)!
var Dp = [Int](repeating: 0, count: num+1)

for i in 2..<num+1 {
    Dp[i] = Dp[i-1] + 1
    if i%2 == 0 {
        Dp[i] = min(Dp[i], Dp[i/2] + 1)
    }
    if i%3 == 0 {
        Dp[i] = min(Dp[i], Dp[i/3] + 1)
    }
    
}

print(Dp[num])
