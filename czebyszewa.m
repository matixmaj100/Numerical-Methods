clc
clear all
close all
f = @(x) x.^2 - x + 1;
a = 1;
b = 4;
n=2;
ti=[-0.577350,0.577350];
%wywolanie
[I, I_p, err] = czeb(f, a, b,n,ti);
function [I, I_p, err] = czeb(f, a, b,n,ti)
h=(b-a)/n;
x=(1/2)*((b+a)+(b-a)*ti);
y=f(x);
% Obliczenie całki numerycznej
I = h*sum(y);
% Obliczenie wartości całki analitycznie
I_p = integral(f,a,b);
% Obliczenie błędu w procentach
err = abs((I_p - I) / I_p) * 100;

end
