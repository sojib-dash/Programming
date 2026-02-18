#include <bits/stdc++.h>
using namespace std;
#define ll long long int
#define MAX 1000000007
int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    int t;
    cin >> t;
    while(t--){
        ll n,k,total=1;
        cin >> n >> k;
        for(int i=1;i<=k;i++){
            total*=n;
            total%=MAX;
        }
        cout << total << '\n';
    }
}
