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
        int n;
        cin >> n;
        vector <int> a(n);
        map<ll,ll> b;
        ll sum=0;
        b[0]=1;
        // int cnt=0; // how many subarrays available whose sum is zero
        bool y=false;
        for(int i=0;i<n;i++){
            cin >> a[i];
            a[i]*=((i%2) ? -1:1);
            sum+=1LL*a[i];
            if(b[sum]){
                // cout << "YES\n";
                // cnt++;
                y = true;
            }
            b[sum]++;
        }
        if(y){
            cout << "YES\n";
            continue;
        }
        cout << "NO\n";
    }
}
