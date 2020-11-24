//
//  main.swift
//  11047
//
//  Created by Yoojin Park on 2020/11/24.
//

// Greedy Algorithms(탐욕법, 탐욕 알고리즘): 문제를 해결하는 과정에서 그 순간순간마다 최적이라고 생각되는 결정을 하는 방식으로 진행하여 최종 해답에 도달하는 문제 해결 방식

import Foundation

let input = readLine()!.split(separator: " ").compactMap({ Int(String($0)) })
let n = input[0]
var k = input[1]

var money: [Int] = []
var result = 0

for _ in 0..<n {
    money.append(Int(readLine()!)!)
}

for m in money.reversed() {
    result += k / m
    k %= m
    if k == 0 { break }
}

print(result)
