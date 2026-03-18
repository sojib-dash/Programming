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
        string s;
        cin >> s;
        vector <int> fr(10,0);
        for(auto x : s) fr[x-'0']++;
        int len=s.length();
        if(len==1){
            cout << s << '\n';
            continue;
        }
        for(int x=1;x<=9*len;x++){
            int tx = x;
            string s_t = to_string(tx);
            while(tx>9){
                int tem=0;
                while(tx!=0){
                    tem+=tx%10;
                    tx/=10;
                }
                tx=tem;
                s_t+=to_string(tx);
            }
            vector <int> t_10(10,0);
            int sum_t = 0;
            for(auto i:s_t){
                t_10[i-'0']++;
                sum_t+=i-'0';
            }
            bool y=true;
            int n_sum=0;
            for(int i=0;i<10;i++){
                n_sum+=(fr[i]-t_10[i])*i;
                if(fr[i] < t_10[i]) y=false;
                if(!y) break;
            }
            if(y && n_sum==x){
                string n_s="";
                for(int i=9;i>=0;i--){
                    int dif=fr[i]-t_10[i];
                    while(dif--){
                        n_s += to_string(i);
                    }
                }
                n_s+=s_t;
                cout << n_s << '\n';
                break;
            }
        }
    }
}
