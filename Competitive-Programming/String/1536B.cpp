#include <bits/stdc++.h>
using namespace std;
#define ll long long int 
int main() {
    // ios::sync_with_stdio(0);
    // cin.tie(0);
    // cout.tie(0);
    //  ------> This is something new finding
    map <string,int> mp;
    queue <string> q;
    for(char i='a';i<='z';i++){
        mp[string(1,i)]=0;
        q.push(string(1,i));
    }
    int tp=26*2;
    int cnt=26;
    while(tp--){
        string cur = q.front();
        q.pop();
        for(char i='a';i<='z';i++){
            q.push(cur+i);
            mp[cur+i]=0;
            cnt++;
            // cout << cur+i << '\n';
        }
    }
    // cout << cnt;
    int t;
    cin >> t;
    while(t--){
        for(auto &b:mp) mp[b.first]=0;
        int n;
        string s,ts="";
        cin >> n >> s;
        for(int i=0;i<n;i++){
            string str="";
            for(int j=i;j<n;j++){
                if(j-i==3) break;
                str+=s[j];
                mp[str]++;
            }
        }
        string str;
        int mn=4;
        for(auto a:mp){
            if(a.second==0 && mn>a.first.length()){
                mn=a.first.length();
                str=a.first;
            }
        }
        cout << str << '\n';
    }
}
// 
