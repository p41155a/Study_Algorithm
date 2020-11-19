//
//  main.swift
//  1654
//
//  Created by Yoojin Park on 2020/11/19.
//

import Foundation

func solution() -> Int {
    let input = readLine()!.split(separator: " ").map({Int($0)!})
    let k = input[0]
    let n = input[1]
    
    var lines = [Int]()
    for _ in 0..<k{
        lines.append(Int(readLine()!)!)
    }
    
    var left = 1
    var right = lines.max()!
    
    var result = 0

    while (left <= right){
        let mid = (left + right) / 2
        var temp = 0
        for line in lines{
            temp += line / mid
        }
        
        if temp >= n{
           if result < mid{
                result = mid
            }
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return result
}

print(solution())
