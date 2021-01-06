import Foundation

func solution(_ p:String) -> String {
    if p.count == 0 { return "" }

    var check = 0
    var u = "" // 분리된 구분
    var v = p // 분리하고 남은 문자
    var isGood = true
    var index = 0
    for (i, c) in v.enumerated() {
        if c == "(" { check += 1 }
        if c == ")" { check -= 1 }
        u.append(c)
        index = i + 1
        if i == 0 { isGood = check > 0 } // 시작하는 시점 - 지금 분리하는 부분이 정상 / 비정상인지 구분
        if i != 0 && check == 0 { break } // 정상적 or 비정상적으로 닫힌 ()까지 분리하기 위함
    }

    v.removeFirst(index)

    if isGood { return u + solution(v) }
    else {
        var newS = ""
        u.removeFirst()
        u.removeLast()

        for c in u {
            newS.append(c == "(" ? ")" : "(")
        }

        return "(" + solution(v) + ")" + newS
    }
}
