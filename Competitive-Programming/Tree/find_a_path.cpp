#include <bits/stdc++.h>
using namespace std;

vector<int>parent;
vector<vector<int>>adj;

void dfs(int child,int p){
    parent[child]=p;
    for(auto node:adj[child]){
        if(node != p){
            dfs(node,child);
        }
    }
}
int main() {
    int n;
    cin >> n;
    adj.resize(n+1);
    parent.resize(n+1);
    for(int i=0;i<n;i++){
        int u,v;
        cin >> u>> v;
        adj[u].push_back(v);
        adj[v].push_back(u);
    }
    int x;
    cin >> x;
    dfs(0,-1);

    vector<int>path;
    while(x!=-1){
        path.push_back(x);
        x=parent[x];
    }
    reverse(path.begin(),path.end());
    for(auto node:path){
        cout << node << " ";
    }
}
