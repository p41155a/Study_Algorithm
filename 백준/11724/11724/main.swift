//
//  main.swift
//  11724
//
//  Created by Yoojin Park on 2020/11/16.
//

import Foundation

var graph: [[Int]] = Array(repeating: [], count: 1001)
var check: [Bool] = Array(repeating: false, count: 1001)
func dfs(start: Int) {
    check[start] = true
    
    for i in 0..<graph[start].count {
        let next = graph[start][i]
        
        if check[next] == false {
            dfs(start: next)
        }
    }
}

var line = readLine()!.split(separator: " ").map( { Int($0)! })
let n = line[0]
let m = line[1]

for _ in 0..<m {
    line = readLine()!.split(separator: " ").map( { Int($0)! })
    let u = line[0]
    let v = line[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

var components = 0
for i in 1...n {
    if check[i] == false {
        dfs(start: i)
        components += 1
    }
}

print(components)
