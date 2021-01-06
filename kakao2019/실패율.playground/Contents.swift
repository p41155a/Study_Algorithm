func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var countArray = Array.init(repeating: 0, count: N) // 각 스테이지 당 같혀 있는 사람들의 수
    var probabilityArray = Array.init(repeating: (Int(0), Double(0.0)), count: N) // 스테이지, 실패율
    var total = stages.count // 각 스테이지를 도전한 사람

    for element in stages {
        guard element != N+1 else { // 모두 통과 했다면 배열에 넣지 않음
            continue
        }
        countArray[element-1] += 1
    }

    for stageNum in 1...N {
        let value = countArray[stageNum-1] // 각 스테이지 클리어하지 못한 사람
        probabilityArray[stageNum-1] =  total == 0 ? (stageNum, 0) : (stageNum, Double(value) / Double(total))
        total -= value

    }
    
    probabilityArray = probabilityArray.sorted(by: { $0.1 == $1.1 ? $1.0 < $1.0 : $0.1 > $1.1 })
    // 실패율이 같다면 스테이지 번호가 작은 순서대로 아니라면 실패율이 큰 순서로 정렬

    return probabilityArray.map{$0.0}
}
