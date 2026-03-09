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
        int n,m;
        cin >> n >> m;
        vector <int> a(n);
        for(auto &x:a){
             cin >> x;
        }
        ll tt=0;
        int pos;
        for(int i=0;i<n;i++){
            ll tem=0;
            int h1=a[i],h2=a[i];
            for(int j=i+1;j<n;j++){
                if(a[j]>h1){
                    h1=a[j];
                    tem+=m-h1;
                }
                else{
                    tem+=m-h1;
                }
            }
            for(int j=i-1;j>=0;j--){
                if(a[j]>h2){
                    h2=a[j];
                    tem+=m-h2;
                }
                else{
                    tem+=m-h2;
                }
            }
            tem+=m-a[i];
            tt=max(tem,tt);
            if(tt==tem) pos=i;
        }
        // remake
        for(int i=pos;i<pos+1;i++){
            int h1=a[i],h2=a[i];
            for(int j=i+1;j<n;j++){
                if(a[j]>h1){
                    h1=a[j];
                    a[j]=m;
                }
                else{
                    a[j]+=m-h1;
                }
            }
            for(int j=i-1;j>=0;j--){
                if(a[j]>h2){
                    h2=a[j];
                    a[j]=m;
                }
                else{
                    a[j]+=m-h2;
                }
            }
            a[i]=m;
        }
        ll ct=0;
        for(int i=0;i<n;i++){
            ll tem=0;
            int h1=a[i],h2=a[i];
            for(int j=i+1;j<n;j++){
                if(a[j]>h1){
                    h1=a[j];
                    tem+=m-h1;
                }
                else{
                    tem+=m-h1;
                }
            }
            for(int j=i-1;j>=0;j--){
                if(a[j]>h2){
                    h2=a[j];
                    tem+=m-h2;
                }
                else{
                    tem+=m-h2;
                }
            }
            tem+=m-a[i];
            ct=max(tem,ct);
        }
        cout << tt + ct << '\n';
    }
}

