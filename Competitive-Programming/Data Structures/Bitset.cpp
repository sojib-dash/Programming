#include <bits/stdc++.h>
using namespace std;
#define ll long long int 
int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    int t;
    cin >> t;
    while(t--){
        int n,x;
        cin >> n >> x;
        vector<int> a(n);
        bitset <100001> dp;
        dp[0]=1;
        for(int i=0;i<n;i++){
            cin >> a[i];
            dp|=(dp<<a[i]);
        }
        if(dp[x]) cout << "Sum is available\n";
        else cout << "Not available\n";
    }
}
