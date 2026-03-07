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
        int n,x,y;
        cin >> n >> x >> y;
        vector <int> a(n);
        map <pair<int,int>,int> mod;
        for(auto &x:a) cin >> x;
        ll tt=0;
        for(int i=n-1;i>=0;i--){
            if(mod[{(x-a[i]%x)%x,a[i]%y}]> 0){
                tt+=1ll*mod[{(x-a[i]%x)%x,a[i]%y}];
            }
            // cout << mx[a[i]%x] << " " << my[a[i]%y] << '\n';
            mod[{a[i]%x,a[i]%y}]++;
        }
        cout << tt << '\n';
    }
}
