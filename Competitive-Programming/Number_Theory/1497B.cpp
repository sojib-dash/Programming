#include <bits/stdc++.h>
using namespace std;
#define ll long long int 
int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    int t;
    cin >> t;
    while(t--){
        int n,m;
        cin >> n >> m;
        vector <int> a(n);
        for(int i=0;i<n;i++){
            int y;
            cin >> y;
            a[i]=y%m;
        }
        sort(a.begin(),a.end());
        //for(auto x:a) cout << x << " ";
        cout << '\n';
        int cnt=0,l=0,r=n-1;
        int sl=1,sr=1;
        while(l<=r){
            if(a[l]==0){
                cnt=1;
                l++;
                continue;
            }
            if(a[l]==a[l+1] && l+1<=r){
                sl++;
                l++;
                continue;
            }
            if(a[r]==a[r-1] && r-1>=l){
                sr++;
                r--;
                continue;
            }
            if(l==r){
                if(2*a[l]==m){
                    cnt++;
                }
                else{
                    cnt+=max(sl,sr);
                }
                break;
            }
            if(a[l]+a[r]==m){
                int tem=sl+sr-(2*min(sl,sr)+1);
                if(tem<0){
                    cnt++;
                }
                else{
                    cnt+=tem+1;
                }
                sl=1;
                sr=1;
                l++;
                r--;
            }
            else if(a[l]+a[r]>m){
                if(2*a[r]==m){
                    cnt++;
                    continue;
                }
                cnt+=sr;
                r--;
                sr=1;
            }
            else if(a[l]+a[r]<m){
                if(2*a[l]==m){
                    cnt++;
                    continue;
                }
                cnt+=sl;
                l++;
                sl=1;
            }
        }
        cout << cnt << '\n';
    }
}
// 
