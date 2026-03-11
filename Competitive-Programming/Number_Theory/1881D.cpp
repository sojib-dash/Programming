#include <bits/stdc++.h>
using namespace std;
#define ll long long int 
vector <int> prms(1000001);
void sieve(){
    for(int i=1;i<=1000000;i++) prms[i]=i;
    for(int i=2;i*i<=1000000;i++){
        if(prms[i]==i){
            for(int j=i*i;j<=1000000;j+=i){
                prms[j]=i;
            }
        }
    }
}
int main() {
    // ios::sync_with_stdio(0);
    // cin.tie(0);
    // cout.tie(0);
    sieve();
    int t;
    cin >> t;
    while(t--){
        int n;
        cin >> n;
        vector <int> a(n),b;
        map <int,int> mp;
        for(int i=0;i<n;i++){
            cin >> a[i];
            while(a[i]>1){
                // cout << prms[a[i]] << " ";
                mp[prms[a[i]]]++;
                a[i]/=prms[a[i]];
            }
            // cout << '\n';
        }
        bool y = true;
        for(auto x:mp){
            // cout << x.second << " ";
            if(x.second%n!=0){
                y=false;
                // break;
            }
        }
        if(y) cout << "YES\n";
        else cout << "NO\n";
    }
}
