import UIKit

func solution(_ record:[String]) -> [String] {
    var result: [[String]] = [] // 아이디, 뒤에 출력하는 내용
    var nickName = [String:String]()
    for re in record {
        let input = re.split(separator: " ").map{ String($0) }
        if input[0] == "Enter" {
            nickName[input[1]] = input[2]
            result.append([input[1], "님이 들어왔습니다."])
        } else if input[0] == "Leave" {
            result.append([input[1], "님이 나갔습니다."])
        } else if input[0] == "Change" {
            nickName[input[1]] = input[2]
        }
    }
    return result.map{"\(nickName[$0[0]]!)\($0[1])"}
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
