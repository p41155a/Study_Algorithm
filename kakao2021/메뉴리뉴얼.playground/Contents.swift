//import UIKit
//
//
//solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
//solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
//solution(["XYZ", "XWY", "WXA"], [2, 3,4])
//
// --------------------------- MARK : 다른 사람들 소스 ----------------------------------
//
//
// 각 메뉴당 만들 수 있는 모든 메뉴를 만들어 key 값에 더하는 방법
func solution1(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String: Int]()

    for order in orders { // 각 메뉴당 만들 수 있는 모든 메뉴를 만듦
        dfs(index: 0, menu: "", characters: order.sorted(), course: course, result: &result) // &result로 주소 값을 전달해주는 방법 (중요)
    }

    var answer = [String]()

    for length in course {
        let temp = result.filter { $0.key.count == length && $0.value > 1 }  // 만들려고 하는 메뉴 수 이며 2번 이상 주문된 메뉴 조합
        let maxNum = temp.values.max()
        let menu = temp.filter { maxNum == $0.value }.map { $0.key } // 각 메뉴 수의 조합 중 가장 많이 시켜진 조합 고름
        answer.append(contentsOf: menu)
    }

    return answer.sorted()
}

func dfs(index: Int, menu: String, characters: [Character], course: [Int], result: inout [String: Int]) {
    if course.contains(menu.count) { // 코스로 만들고 싶은 메뉴의 개수가 맞다면
        if result[menu] == nil {
            result.updateValue(1, forKey: menu)
        } else {
            result.updateValue(result[menu]! + 1, forKey: menu)
        }
    }

    for i in index ..< characters.count {
        dfs(index: i + 1, menu: "\(menu)\(characters[i])", characters: characters, course: course, result: &result)
    }
}
//
// -------------------------------------------------------------
//
func solution2(_ orders:[String], _ course:[Int]) -> [String] {
    var resultOrders = [String]()

    for courseCount in course {
        var maxCourseCount = 0
        var newOrderTable = [String: Int]()

        for order in orders {
            var newOrders = [String]()
            combination(Array(order), courseCount, 0, "", &newOrders) // 문자 배열을 courseCount 개수만큼 조합
            for newOrder in newOrders {
                newOrderTable[newOrder, default: 0] += 1 // 만들어진 조합을 문자열에 넣는다
                maxCourseCount = max(maxCourseCount, newOrderTable[newOrder]!) // 이 부분 개선 필요해보임
            }
        }

        if maxCourseCount > 1 { // 두번 이상 시켜졌을 때
            resultOrders.append(contentsOf: newOrderTable.filter { $0.value == maxCourseCount }.map { $0.key })
        }
    }

    return resultOrders.sorted()
}

func combination(_ order: [Character], _ courseCount: Int, _ idx: Int, _ combined: String, _ newOrders: inout [String]) {
    
    guard combined.count < courseCount else {
        newOrders.append(String(combined.sorted())) // 조합하여 만든 combined가 조합하려는 배열 크기인 courseCount와 같을 때 실행
        return
    }
    guard idx < order.count else { return } // 문자열 길이를 넘어가면 안된다 -> order[idx]를 하려고 하기 때문

    combination(Array(order), courseCount, idx+1, combined, &newOrders) // 현재 자리수의 문자를 포함하지 않는 경우
    combination(Array(order), courseCount, idx+1, combined + String(order[idx]), &newOrders) // 포함 하는 경우
}
//
// -------------------------------------------------------------
//

func solution3(_ orders:[String], _ course:[Int]) -> [String] {

    var orderDict = [String:Int]()
    var countDict = [Int:[(String,Int)]]()


    var temp = [String]()
    func combination(_ target : [String], _ idx : Int, _ count : Int , _ limit : Int ) {
        if count == limit {
            let s = temp.reduce("", +)
            orderDict[s] = orderDict[s] == nil ? 1 : orderDict[s]!+1
            return
        }

        for i in idx..<target.count {
            temp.append(target[i])
            combination(target, i+1, count+1, limit)
            temp.removeLast()
        }
    }

    for limit in course {
        for order in orders {
            let sortedOrder = order.map{String($0)}.sorted()
            combination(sortedOrder, 0, 0, limit)
        }
    }

    orderDict.filter{$0.value >= 2 }.forEach{
        if countDict[$0.key.count] == nil {
            countDict[$0.key.count] = [($0.key,$0.value)]
        }else {
            countDict[$0.key.count]!.append(($0.key,$0.value ))
        }
    }

    var answer = [String]()
    for limit in course {
        if countDict[limit] != nil {
            let list = countDict[limit]!.sorted(by: {$0.1 > $1.1})
            answer.append(contentsOf: list.filter{list.first!.1 == $0.1}.map{$0.0})
        }
    }

    return answer.sorted(by: <)
}
