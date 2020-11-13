//
//  main.swift
//  11057
//
//  Created by Yoojin Park on 2020/11/12.
//

import Foundation

//var N: Int = Int(readLine()!)!
//var mod: Int = 10007
//var ascendingNum: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N+1)
//
//for i in 0...9 {
//    ascendingNum[1][i] = 1 // 맨 앞의 수가 i인 N의 자리 수
//}
//if N > 1 {
//    for i in 2...N {
//        ascendingNum[i][9] = 1
//        for j in (0...8).reversed() {
//            ascendingNum[i][j] = (ascendingNum[i][j+1] + ascendingNum[i-1][j]) % mod
//        }
//    }
//}
//print((ascendingNum[N].reduce(0, +))%mod)

var N: Int = Int(readLine()!)!
let mod: Int = 10007
var nums : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N+1)

for i in 0...9 {
    nums[1][i] = 1
}

if N > 1 {
    for i in 2...N {
        nums[i][9] = 1
        for j in (0...8).reversed() {
            nums[i][j] = (nums[i][j+1] + nums[i-1][j]) % mod
        }
    }
}

print((nums[N].reduce(0, +))%mod)
