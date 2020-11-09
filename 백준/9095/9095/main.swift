//
//  main.swift
//  9095
//
//  Created by Yoojin Park on 2020/11/06.
//

import Foundation

var T = Int(readLine()!)!
var num = [Int]()
for _ in 0..<T {
    num.append(Int(readLine()!)!)
}

var arr = [Int](repeating: 0, count: (num.max() ?? 11) + 1)

arr[0] = 1
arr[1] = 1

for i in 2..<arr.count {
    if i >= 3 {
        arr[i] += arr[i-3]
    }
    if i >= 2 {
        arr[i] += arr[i-2]
    }
    if i >= 1 {
        arr[i] += arr[i-1]
    }
}

num.forEach { n in
    print(arr[n])
}
