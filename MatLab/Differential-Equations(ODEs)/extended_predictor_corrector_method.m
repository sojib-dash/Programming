% Adams–Bashforth (predictor) + Adams–Moulton (corrector)
% Adams-Bashforth–Moulton method
clc;
clear;

f = @(x,y) x + y;

h = 0.001;
x0 = 0;
y0 = 1;
n = 1000;

x = zeros(1,n+1);
y = zeros(1,n+1);

x(1) = x0;
y(1) = y0;

for i = 1:1
    k1 = f(x(i), y(i));
    k2 = f(x(i) + h/2, y(i) + h*k1/2);
    k3 = f(x(i) + h/2, y(i) + h*k2/2);
    k4 = f(x(i) + h, y(i) + h*k3);
    
    y(i+1) = y(i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    x(i+1) = x(i) + h;
end

for i = 2:n
    
    f_n   = f(x(i), y(i));
    f_n1  = f(x(i-1), y(i-1));
    
    y_pred = y(i) + (h/2)*(3*f_n - f_n1);
    
    f_pred = f(x(i)+h, y_pred);
    
    y(i+1) = y(i) + (h/12)*(5*f_pred + 8*f_n - f_n1);
    
    x(i+1) = x(i) + h;
    
    fprintf('x = %.2f, y = %.10f\n', x(i+1), y(i+1));
end
