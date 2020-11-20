//https://wjdgus2951.tistory.com/56
#include <iostream>

#define MAX 1000001

using namespace std;

int A[MAX];
int B[MAX];
int ans[MAX];
int N, M;

void merge()
{
    int i = 0; int j = 0; int k = 0;

    while (i < N && j < M)
    {
        if (A[i] <= B[j]) ans[k++] = A[i++];
        else ans[k++] = B[j++];
    }

    // 남은 배열의 원소들을 모두 넣는 과정
    // 정렬되어 있는 배열이기 때문에 그냥 넣으면 됨
    while (i < N) ans[k++] = A[i++];
    while (j < M) ans[k++] = B[j++];
}

int main()
{
    ios::sync_with_stdio(false); // 속도를 위한 코드 - C 표준 stream과 C++ 표준 stream의 동기화를 끊습니다.
    // cin.tie(0); // cin과 cout이 묶여있는 것을 풀어준다. 좀 저 빠르게 해준다고 하지만 여기서는 빠르지 않아 주석
    // cout.tie(0);

    cin >> N >> M;

    for (int i = 0; i < N; i++) cin >> A[i];
    for (int i = 0; i < M; i++) cin >> B[i];

    int length = N + M;

    merge();

    for (int i = 0; i < length; i++)
    {
        cout << ans[i]; if (i != length - 1) cout << " ";
    }

    cout << "\n";

    return 0;
}

// 숏코딩
// 위에 것이 더 빠름
// #include <iostream>
 
// using namespace std;

// int main() {
//     int a[1000001];
//     int b[1000001];
//     int n, m;
 
//     ios::sync_with_stdio(false);
//     cin.tie(0);
    
//     cin >> n >> m;
    
//     for (int i = 0; i < n; i++) cin >> a[i];
//     for (int i = 0; i < m; i++) cin >> b[i];
    
//     int v = 0;
//     int u = 0;
//     while (v < n && u < m) {
//         if (a[v] <= b[u]) printf("%d ", a[v++]);
//         else printf("%d ", b[u++]);
//     }
//     while (v < n) printf("%d ", a[v++]);
//     while (u < m) printf("%d ", b[u++]);
//     printf("\n");
// }