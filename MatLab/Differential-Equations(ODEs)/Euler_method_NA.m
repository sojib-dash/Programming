clear;clc;
f = @(x,y) x+y;
x=0;
y=1;
h=0.1;
n=10;

for i=1:n
    y=y+h*f(x,y);
    x=x+h;
    fprintf('x = %.2f, y = %.5f\n', x, y);
end
disp('y = ');
disp(y);
