//
//  main.swift
//  1260 : DFS와 BFS
//
//  Created by Yoojin Park on 2020/11/09.
//

import Foundation

func DFS(start: Int) {
    var visited: [Int] = []
    var stack = [start]
    
    while !stack.isEmpty {
        let node = stack.popLast()!
        
        if !visited.contains(node) {
            visited.append(node)
            print(node, terminator: " ")
            stack.append(contentsOf: graph[node].sorted(by: >)) // 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문
        }
    }
}

func BFS(start: Int) {
    var visited: [Int] = []
    var queue = [start]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if !visited.contains(node) {
            visited.append(node)
            print(node, terminator: " ")
            queue.append(contentsOf: graph[node].sorted())
        }
    }
}

var input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0]
let m = input[1]
let v = input[2]

var graph: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let inputLine = readLine()!.split(separator: " ").map { Int($0)! }
    
    let src = inputLine[0]
    let dest = inputLine[1]
    graph[src].append(dest)
    graph[dest].append(src)
}

DFS(start: v)
print()
BFS(start: v)
