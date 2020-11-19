//
//  main.swift
//  2805
//
//  Created by Yoojin Park on 2020/11/19.
//

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let m = input[1]
let trees = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }

var min = 0
var max = trees.max()!
var mid = 0
var result = 0
var temp = 0

while min < max {
  mid = (min + max) / 2
  temp = trees.map { $0 > mid ? $0 - mid : 0 }.reduce(0, +)
  
  if(temp < m) {
    max = mid
  } else {
    result = mid
    min = mid + 1
  }
}

print(result)

//func getTree(_ height: Int) -> Int {
//  var sum = 0
//  for tree in trees where tree > height {
//    sum += tree - height
//  }
//  return sum
//}
