//
//  main.swift
//  2630
//
//  Created by Yoojin Park on 2020/11/23.
//

// 분할정복: 분할정복법은 주어진 문제를 작은 사례로 나누고 각각의 작은 문제들을 해결하여 정복하는 방법
// 쿼드트리 만드는 문제

import Foundation

let count = Int(readLine()!)!
var paper: [[Int]] = []

var zero = 0
var one = 0

for _ in 1...count {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    paper.append(input)
}

func dfs(_ index: (x: Int, y: Int), _ size: Int) {
    let sample = paper[index.x][index.y]
    var check = true
    for i in index.x...index.x+size-1 {
        for j in index.y...index.y+size-1 {
            if paper[i][j] != sample { // 중간에 다른 숫자가 섞여 있으면
                check = false
                // 자름
                dfs((x: index.x, y: index.y), size/2)
                dfs((x: index.x + size/2, y: index.y), size/2)
                dfs((x: index.x, y: index.y + size/2), size/2)
                dfs((x: index.x + size/2, y: index.y + size/2), size/2)
                return
            }
        }
    }
    
    if check == true {
        if sample == 0 {
            zero += 1
        } else {
            one += 1
        }
    }
}

dfs((x: 0, y: 0), count)
print(zero)
print(one)
