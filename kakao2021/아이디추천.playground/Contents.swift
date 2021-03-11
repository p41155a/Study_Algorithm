import UIKit

func solution(_ new_id:String) -> String {
    var switchedId = new_id
    // 1
    switchedId = switchedId.lowercased()
    // 2 : 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거
    switchedId = switchedId.filter { $0.isLetter || $0.isNumber || $0 == "_" || $0 == "-" || $0 == "." }
    // 3 : 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)
    while switchedId.contains("..") { // 3
        switchedId = switchedId.replacingOccurrences(of: "..", with: ".")
    }
    // 4 : 마침표(.)가 처음이나 끝에 위치한다면 제거
    while switchedId.hasPrefix(".") {
        switchedId.removeFirst()
    }
    while switchedId.hasSuffix(".") {
        switchedId.removeLast()
    }
    // 5
    switchedId = switchedId.isEmpty ? "a" : switchedId
    // 6
    switchedId = "\(switchedId.prefix(15))"
    while switchedId.hasSuffix(".") {
        switchedId.removeLast()
    }
    // 7
    while switchedId.count < 3 {
        switchedId = switchedId + String(switchedId.last!)
    }
    return switchedId
}

print(solution("...!@BaT#*..y.abcdefghijklm"))
print(solution("z-+.^."))
print(solution("=.="))
print(solution("123_.def"))
print(solution("abcdefghijklmn.p"))
