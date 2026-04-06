clear;clc;

f = @(x,y) x+y;
h=0.1;
x = 0:h:1;
n=length(x);
y=zeros(1,n);
y(1)=1;

for i=1:3
    s1=f(x(i), y(i));
    s2=f(x(i)+h/2, h*s1/2);
    s3=f(x(i)+h/2, h*s2/2);
    s4=f(x(i)+h,y(i)+h*s3);

    y(i+1)=y(i) + (h/6)*(s1+2*s2+2*s3+s4);
end

for i=4:n-1
    y_pred = y(i-3) + (4*h/3) * (2*f(x(i-2),y(i-2)) -f(x(i-1),y(i-1)) +2*f(x(i),y(i)));
    y(i+1) = y(i-1) + (h/3) * (f(x(i-1),y(i-1)) + 4*f(x(i),y(i)) +f(x(i+1),y_pred));
    fprintf('x = %.2f , y = %.10f\n',x(i+1),y(i+1));
end
