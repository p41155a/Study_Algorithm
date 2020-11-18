//
//  main.swift
//  2331
//
//  Created by Yoojin Park on 2020/11/17.
//

// pow 함수 쓰는 것 보다 이게 더 빠르게 작동하는 듯
extension Int{
    func pow(_ p: Int) -> Int{
        let array = (1...p).map { _ in self } //3.pow(10) == 3^10
        return array.reduce(1, * )
    }
}
extension String{
    func next(_ p: Int) -> String{
        let array = self
            .map { String($0) } // character은 Int로 변환 불가함으로 String 배열
            .map { Int($0)! } // 각자리 수의 배열
            .map { $0.pow(p) } // 각자리 수를 제곱
        return String(array.reduce(0, +))
    }
}

let read = readLine()!.split(separator: " ").map{ String($0) }
var A = read[0], P = Int(read[1])!

var seen = [String: Int]()

while seen[A] != 3 {
    seen[A] = (seen[A] ?? 0) + 1
    A = A.next(P)
}

let once = seen.filter { $0.value == 1}
print(once.count)


// while seen[A] != 2 문은 덜 돌지만 배열에 수를 추가 시키는 등 여러 동작이 필요해
// 걸린시간은 같게 됨

//extension Int{
//    func pow(_ p: Int) -> Int{
//        let array = (1...p).map { _ in self } //3.pow(10) == 3^10
//        return array.reduce(1, * )
//    }
//}
//extension String{
//    func next(_ p: Int) -> String{
//        let array = self
//            .map { String($0) } // character은 Int로 변환 불가함으로 String 배열
//            .map { Int($0)! } // 각자리 수의 배열
//            .map { $0.pow(p) } // 각자리 수를 제곱
//        return String(array.reduce(0, +))
//    }
//}
//
//let read = readLine()!.split(separator: " ").map{ String($0) }
//var A = read[0], P = Int(read[1])!
//var prev = A
//var arr = [A]
//
//var seen = [String: Int]()
//
//while seen[prev] != 2 {
//    seen[A] = (seen[A] ?? 0) + 1
//    prev = A
//    A = A.next(P)
//    arr.append(A)
//}
//
//for i in 0..<arr.count {
//    if arr[i] == prev {
//        print(i)
//        break
//    }
//}


