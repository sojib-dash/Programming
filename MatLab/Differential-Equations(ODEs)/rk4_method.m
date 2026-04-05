clear;clc;
f = @(x,y) x+y;
x=0;
y=1;
h=0.001;
n=1000;

for i=1:n
    slope1=f(x,y);
    slope2=f(x+h/2,y+(h/2)*slope1);
    slope3=f(x+h/2,y+(h/2)*slope2);
    slope4=f(x+h,y+h*slope3);

    y=y+(h/6)*(slope1+2*slope2+2*slope3+slope4);
    x=x+h;
    fprintf('x = %.2f, y = %.10f\n', x, y);
end
disp('y = ');
disp(y);
