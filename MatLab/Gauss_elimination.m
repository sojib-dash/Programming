clear;clc;
A = [1 1 1; 
    2 3 1;
    1 2 3]
B = [6;
    10;
    13]
Aug = [A B];
[n m] = size(Aug);
for i=1:n
    if Aug(i,i) == 0
        for k=i+1:n
            if Aug(k,i) ~= 0
                temp = Aug(i,:);
                Aug(i,:) = Aug(k,:);
                Aug(k,:) = temp;
                break;
            end
        end
    end
    if Aug(i,i)==0
        error('Infinite Solution Exist');
    end
    Aug(i,:) = Aug(i,:) / Aug(i,i);
    for j=i+1:n
        factor=Aug(j,i);
        Aug(j,:) = Aug(j,:) - factor*Aug(i,:);
    end
end
X=zeros(n,1);
for i=n:-1:1
    X(i)=Aug(i,end);
    for j=i+1:n
        X(i)= X(i)-Aug(i,j)*X(j);
    end
    X(i)= X(i)/Aug(i,i);
end
disp('Upper Triangle Matrix');
disp(Aug);
disp('Solution:');
disp(X);
