import UIKit

// Swift의 sort는 Timsort로 구현되어있다.
// 따라서 O(nlogn)의 시간복잡도를 가지며 불안정 정렬이다.

var arr = [9,8,7,6,5,4,3,2,1]

func selectionSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count{
        var min = i
        for j in i+1..<arr.count{
            if(arr[min] > arr[j]){
                min = j
            }
        }
        if i != min{
            arr.swapAt(i, min)
        }
    }
    return arr
}

func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        var check = true
        for j in 0..<(arr.count-1)-i {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
                check = false
            }
        }
        if check { break }
    }
    return arr
}

func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 1..<arr.count {
        var y = i
        // 앞쪽은 정렬되어있다고 가정하기 때문에 비교해서 작은값이 있는 곳에서는 바꾸지 않고 중단가능
        while y > 0, arr[y] < arr[y-1] {
            arr.swapAt(y, y-1)
            y -= 1
        }
    }
    return arr
}

// for 반복문을 이용해서 left, right를 나눌 경우 n번 걸리지만, filter를 이용할 경우 2n번 걸림 효율성을 더욱 원하면 for문 사용
func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else { return array } // 배열이 비어있거나 하나만 있는 경우는 이미 '정렬'
 
    let pivot = first // 피봇의 기준이 무엇이냐에 따라 정렬의 과정도 달라진다. ex) array[array.count/2] 이렇게 다르게 할 수도 있음
    let less = array.filter { $0 < pivot } // 피봇을 기준으로 피봇보다 같거나 작은 수들
    let greater = array.filter { $0 > pivot } // 피봇을 기준으로 피봇보다 같거나 큰 수들
    
    return quickSort(less) + [pivot] + quickSort(greater)
}


processTime{ print(selectionSort(arr)) }
processTime{ print(bubbleSort(arr)) }
processTime{ print(insertionSort(arr)) }
processTime{ print(insertionSort(arr)) }

func processTime(blockFunction: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    blockFunction()
    let processTime = CFAbsoluteTimeGetCurrent() - startTime
    print("걸린 시간 = \(processTime)")
}
