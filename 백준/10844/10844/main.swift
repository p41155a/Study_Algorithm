//
//  main.swift
//  10844 : 쉬운 계단 수
//
//  Created by Yoojin Park on 2020/11/09.
//

import Foundation

var N = Int(readLine()!)! // n은 100보다 작거나 값은 자연수

var arr = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N+1)

if N == 1 {
    print(9)
} else {
    for i in 1...9 {
        arr[1][i] = 1
    }
    
    for i in 2...N {
        for j in 0...9 {
            if j == 0 {
                arr[i][j] = arr[i-1][1] % 1000000000
            } else if j == 9 {
                arr[i][j] = arr[i-1][8] % 1000000000
            } else {
                arr[i][j] = (arr[i-1][j-1] + arr[i-1][j+1]) % 1000000000
            }
        }
    }
    
    var result = 0
    for i in 0..<10 {
        result += arr[N][i]
    }
    print(result % 1000000000)
}

