func solution(_ s:String) -> Int{
  var stack = [Character]()
  let arr = Array(s) // 문자열을 그대로 가져오기 보다는 arr로 먼저 만들기
  
    // arr.count도 s.count보다 빠름
  guard arr.count % 2 == 0 else { return 0 }
  
  for i in arr.indices {
        // 또한 optional보다 언래핑된 것이 빠름으로 isEmpty 조건문을 더 두는 것이 더 빠름
    if stack.isEmpty { stack.append(arr[i]) }
    else {
          if stack.last! == arr[i] {
            stack.removeLast()
          } else {
            stack.append(arr[i])
          }
    }
  }
  
  return stack.isEmpty ? 1 : 0
}
