% When the matrix is diagonally dominent,then jacobi method can be applied.
clear;clc;
A = [10 5 1; 
    7 11 2;
    6 3 9]
B = [6;
    10;
    13]
n = length(B);
x_ancient = zeros(n,1);
tol=1e-6;
max_iter=100;
for t=1:max_iter
    x_new=zeros(n,1);
    for i=1:n
        sum=0;
        for j=1:n
            if j~=i
                sum = sum + A(i,j)*x_ancient(j);
            end
        end
        x_new(i)=(B(i)-sum)/A(i,i);
    end
    if norm(x_new-x_ancient,inf)<tol
        break
    end
    x_ancient=x_new
end
disp('Solution:');
disp(x_ancient);
