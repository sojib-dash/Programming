// When j must not be equal for the two condition
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
        map <int,int> mx,my;
        for(auto &x:a) cin >> x;
        int tt=0;
        for(int i=n-1;i>=0;i--){
            if(mx[x-a[i]%x]> 0 && my[a[i]%y]> 0){
                tt+=min(mx[a[i]%x],my[a[i]%y]);
            }
            cout << mx[a[i]%x] << " " << my[a[i]%y] << '\n';
            mx[a[i]%x]++;
            my[a[i]%y]++;
        }
        cout << tt << '\n';
    }
}
