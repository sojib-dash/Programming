! When the matrix is diagonally dominent
! Modified version of Gauss Seidel Method 
clear;clc;
A = [10 1 1;
     2 10 1;
     2 2 10];

B = [12; 13; 14];

n = length(B);
x_ancient = zeros(n,1);
tol=1e-6;
max_iter=100;
w=1.3;

for t=1:max_iter
    x_new=x_ancient;
    for i=1:n
        sum=0;
        for j=1:n
            if j~=i
                sum = sum + A(i,j)*x_new(j);
            end
        end
        x_new(i)=w*(B(i)-sum)/A(i,i)+(1-w)*x_new(i);
    end
    if norm(x_new-x_ancient,inf)<tol
        break
    end
    x_ancient=x_new;
end
disp('Solution:');
disp(x_ancient);
