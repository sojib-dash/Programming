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
        error('No Unique Solution Exist');
    end
    Aug(i,:) = Aug(i,:) / Aug(i,i);
    for j=1:n
        if j~=i
            factor=Aug(j,i);
            Aug(j,:) = Aug(j,:) - factor*Aug(i,:);
        end
    end
end
disp('Reduced Row Echelon Form:');
disp(Aug);
disp('Solution:')
X=Aug(:,end);
disp(X);
