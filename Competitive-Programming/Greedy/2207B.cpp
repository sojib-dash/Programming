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
        int n,m,l;
        cin >> n >> m >> l;
        vector <int> a(n),b(m,0);
        for(auto &x:a) cin >> x;
        int tem=n;
        for(int i=1;i<=l;i++){
            int k=min(m,tem+1);
            b[k-1]+=1;
            sort(b.begin(),b.end(),greater<int>());
            if(tem>0 && a[n-tem]==i){
                tem--;
                b[0]=0;
                sort(b.begin(),b.end(),greater<int>());
            }
        }
        cout << b[0] << '\n';
    }
}
