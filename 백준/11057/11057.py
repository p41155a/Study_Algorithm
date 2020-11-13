N = int(input())
mod = 10007

ascendingNum = [[0]*10]*(N+1)
for i in range(0, 10):
    ascendingNum[1][i] = 1 # 맨 앞의 수가 i인 N의 자리 수
for i in range(2, N+1):
    ascendingNum[i][9] = 1
    for j in range(8, -1, -1):
        ascendingNum[i][j] = (ascendingNum[i][j+1] + ascendingNum[i-1][j]) % mod
print(sum(ascendingNum[N])%mod)