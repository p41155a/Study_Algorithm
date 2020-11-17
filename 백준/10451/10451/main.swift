//
//  main.swift
//  10451
//
//  Created by Yoojin Park on 2020/11/17.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {

    let n = Int(readLine()!)!
    var line: [Int] = readLine()!.split(separator: " ").map({ Int($0)! })
    line.insert(0, at: 0)
    var check: [Bool] = Array(repeating: false, count: n+1)

    func dfs(_ node: Int) {
        check[node] = true
        let nextNode = line[node]

        if check[nextNode] == false {
            dfs(nextNode)
        }
    }

    var cycles = 0
    for i in 1...n {
        if check[i] == false {
            dfs(i)
            cycles += 1
        }
    }

    print(cycles)
}
