func solution(_ relation:[[String]]) -> Int {
    var candidateKey = [Int]()
    let row = relation.count
    let col = relation[0].count

    // 2^col 갯수만큼 키 조합을 만들 수 있음
    for i in 1 ..< Int(pow(2.0, Double(col))) {
        // 중복을 없애주는 tempSet으로 조합가능한 키 묶음을 생성
        var tempSet = Set<String>()
        for j in 0..<row {
            var tmp = ""
            for k in 0..<col {
                if (i & (1 << k)) != 0 {
                    tmp += relation[j][k]
                }
            }
            tempSet.insert(tmp)
        }

        // 중복이 없는 키 묶음에 대해서만 연산하여 유일성 획득
        if tempSet.count == row {
            var contains = true

            // 후보키의 최소성 판정
            for num in candidateKey {
                if (num & i) == num {
                    contains = false
                    break
                }
            }
            // 후보키가 없으면 추가
            if contains {
                candidateKey.append(i)
            }
        }
    }

    return candidateKey.count
}
