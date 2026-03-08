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
        vector <pair<int,pair<int,int>>> a(n);
        for(int i=0;i<n;i++){
            cin >> a[i].first;
            // if(i==0){
            //     a[i].second.first=-1;
            // }
            // else{
            //     if(a[i-1].first!=a[i].first){
            //         a[i].second.first=i;
            //     }
            //     else{
            //         a[i].second.first=a[i-1].second.first;
            //     }
            // }
        }
        for(int i=n-1;i>=0;i--){
            if(i==n-1){
                a[i].second.second=-1;
            }
            else{
                if(a[i+1].first!=a[i].first){
                    a[i].second.second=i+2;
                }
                else{
                    a[i].second.second=a[i+1].second.second;
                }
            }
        }
        // for(int i=0;i<n;i++){
        //     cout << a[i].second.second << " ";
        // }
        // cout << '\n';
        int q;
        cin >> q;
        for(int i=0;i<q;i++){
            int x,y;
            cin >> x >> y;
            if(a[x-1].second.second<=y && a[x-1].second.second!=-1){
                cout << x << " " << a[x-1].second.second << '\n';
            }
            else{
                cout << -1 << " " << -1 << '\n';
            }
        }
    }
}
