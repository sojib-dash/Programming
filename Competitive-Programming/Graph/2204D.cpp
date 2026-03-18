#include <bits/stdc++.h>
using namespace std;
#define ll long long int
//--------------------------------------
#define N 200006

void adjacent(int n, int m,vector<vector<int>> &adjacents){
    for(int i=0;i<m;i++){
        int u,v;
        cin >> u >> v; 
        adjacents[u].push_back(v);
        adjacents[v].push_back(u);
    }
}
//----------------------------------------
int color[N];
bool is_bipartile=true;
void dfs(int u,vector<int> &set0,vector<int>&set1,vector<vector<int>> &adjacents){
    if(color[u]==0) set0.push_back(u);
    else set1.push_back(u);

    for(int v:adjacents[u]){
        if(color[v]==-1){
            color[v] = color[u] ^ 1;
            dfs(v,set0,set1,adjacents);
        }
        else if(color[v]==color[u]) is_bipartile=false;
    }
}
void Is_Bipartile_then_count(int n,vector<vector<int>> &adjacents){
    int count=0;
    for(int i=1;i<=n;i++){
        is_bipartile=true;
        if(color[i]==-1){
            vector <int> set0,set1;
            color[i]=0;
            dfs(i,set0,set1,adjacents);
            if(is_bipartile){
                count+=max(set0.size(),set1.size());
            }
        }

    }
    cout << count << '\n';
}
//-------------------------------------------

int main() {
    // ios::sync_with_stdio(0);
    // cin.tie(0);
    // cout.tie(0);
    int t;
    cin >> t;
    while(t--){
        int n,m;
        cin >> n >> m;
        vector <vector<int>> adjacents(n+1);
        adjacent(n,m,adjacents);
        fill(color,color+N,-1);
        Is_Bipartile_then_count(n,adjacents);
    }
}
