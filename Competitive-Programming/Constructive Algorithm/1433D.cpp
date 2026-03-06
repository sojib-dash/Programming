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
        vector <pair<int,int>> b;
        int il,sil,pos;
        for(int i=0;i<n;i++){
            cin >> a[i];
            if(i==0) il=a[i];
            else if(il!=a[i]){
               sil=a[i];
               pos=i+1;
               b.push_back({1,pos});
            }
        }
        if(b.size()==0){
            cout << "NO\n";
            continue;
        }
        else{
            cout << "YES\n";
        }
        for(int i=1;i<n;i++){
            if(a[i]==il){
                b.push_back({i+1,pos});
            }
        }
        for(auto x:b){
            cout << x.first << " " << x.second << '\n';
        }
    }
}
