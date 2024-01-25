clc
clear all
close all
f = @(x,y) 0.1*x*y;
x0 = 0;
y0 = 1;
xmax = 3;
n = 5;
[y] = rungeKutta(f, x0, y0, n, xmax);

function [y] = rungeKutta(f, x0, y0, n, xmax)
    x = linspace(x0, xmax, n+2);
    y = zeros(size(x));
    y(1) = y0;

    for i=1:length(x)-1
        h = x(i+1) - x(i);
        k1 = f(x(i), y(i));
        k2 = f(x(i) + 0.5*h, y(i) + 0.5*h*k1);
        k3 = f(x(i) + 0.5*h, y(i) + 0.5*h*k2);
        k4 = f(x(i) + h, y(i) + h*k3);
        y(i+1) = y(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end

    yrk = y;  % Rozwiązanie metodą Runge-Kutty


    c = y0 / exp(0.05 * x0^2);
    yd = c * exp(0.05 * x.^2);  % Rozwiązanie dokładne (w przypadku tego równania)

    blad = yrk - yd;  % Błąd rozwiązania

    % Tabelka
    T = table(x', yrk', yd', blad', 'VariableNames', {'x', 'yrk', 'yd', 'blad'});
    disp(T);
end
