#include <iostream>
using namespace std;

int main()
{
    int N; 
    cin >> N; 
	int ascendingNum[N+1][10];
    int mod = 10007;
    int sum = 0;

	for (int i = 0; i < 10; i++)
		ascendingNum[1][i] = 1; // 맨 앞의 수가 i인 N의 자리 수

	for (int i = 2; i <= N; i++)
	{
        ascendingNum[i][9] = 1;
		for (int j = 8; j > -1; j--)
		{
			ascendingNum[i][j] = (ascendingNum[i][j+1] + ascendingNum[i-1][j]) % mod;
		}
	}
    
	for (int i = 0; i < 10; i++)
		sum = (sum + ascendingNum[N][i]) %10007;

	cout << sum %10007<<'\n';
}