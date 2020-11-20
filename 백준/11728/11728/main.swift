//
//  main.swift
//  11728
//
//  Created by Yoojin Park on 2020/11/20.
//

// chh0107님의 소스
import Foundation

final class FileIO {
   private var buffer:[UInt8]
   private var index: Int

   init(fileHandle: FileHandle = FileHandle.standardInput) {
       buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
       index = 0
   }

   @inline(__always) private func read() -> UInt8 {
       defer { index += 1 }

       return buffer.withUnsafeBufferPointer { $0[index] }
   }

   @inline(__always) func readInt() -> Int {
       var sum = 0
       var now = read()
       var isPositive = true

       while now == 10
           || now == 32 { now = read() } // 공백과 줄바꿈 무시
       if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
       while now >= 48, now <= 57 {
           sum = sum * 10 + Int(now-48)
           now = read()
       }

       return sum * (isPositive ? 1:-1)
   }

   @inline(__always) func readString() -> String {
       var str = ""
       var now = read()

       while now == 10
           || now == 32 { now = read() } // 공백과 줄바꿈 무시
       while now != 10
           && now != 32 && now != 0 {
               str += String(bytes: [now], encoding: .ascii)!
               now = read()
       }

       return str
   }
}

let fIO = FileIO()

let n = fIO.readInt()
let m = fIO.readInt()

var arr1 = [Int]()
arr1.reserveCapacity(n)
var arr2 = [Int]()
arr2.reserveCapacity(m)

for _ in 0..<n {
    arr1.append(fIO.readInt())
}

for _ in 0..<m {
    arr2.append(fIO.readInt())
}

var index1 = 0
var index2 = 0

while index1 < arr1.count, index2 < arr2.count {
    if arr1[index1]<arr2[index2] {
        print(arr1[index1], terminator: " ")
        index1+=1
    } else {
        print(arr2[index2], terminator: " ")
        index2+=1
    }
}

if index1 == arr1.count {
    for i in index2..<arr2.count {
        print(arr2[i], terminator: " ")
    }
} else {
    for i in index1..<arr1.count {
        print(arr1[i], terminator: " ")
    }
}
