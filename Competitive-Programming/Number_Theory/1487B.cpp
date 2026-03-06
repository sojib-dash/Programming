#include <bits/stdc++.h>
using namespace std;
#define ll long long int 
int main() {
    // ios::sync_with_stdio(0);
    // cin.tie(0);
    // cout.tie(0);
    int t;
    cin >> t;
    while(t--){
        int n,k;
        cin >> n >> k;
        if(n%2==0){
            if(k%n==0) cout << n << '\n';
            else cout << k%n << '\n';
            continue;
        }
        int tk=n/2;
        long long int total=1LL*(k/tk)*(tk+1)+k%tk;
        //cout << total << "!! ";
        if(total%(tk+1)==0) total--;
        if(total%n==0) cout << n << '\n';
        else cout << total%n << '\n';
    }
}
