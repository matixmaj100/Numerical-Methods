clc
clear all
close all
A = [7 5 8 -5 4 -1 -10;
 -4 6 3 -4 -3 -7 9;
 -1 8 6 8 -7 -8 10;
 -4 8 6 0 1 7 -5;
 1 10 9 -1 -6 2 8;
 -3 5 -1 0 -5 0 5;
 -9 10 3 -4 -8 6 10];
b=[75 -17 -150 103 31 -28 89]' ;


A1= [60 10 -1.8 6.8 -6.9 7.3 -4;
 -4.3 -83 -8 2.3 -1.2 -1.4 5.7;
 -8.3 -9.6 10 4.6 3.3 9.2 5.6;
 -7.6 4.3 -4.1 -14 8.6 -7 8.5;
 -6.3 0.8 -4.5 -0.3 31 0.9 -4.7;
 4 2.4 -0.2 -2.4 -2.1 42 -9.5;
 5.9 -3 -1 6.9 -3.8 -5.1 59];
b1=[411.7 -56.7 -168 -134 -44.9 174 -354.6]';

A2=[7 -2 0 -1 0 0 -1;
 -1 5 -1 0 -1 -1 0;
 -1 -2 4 0 -1 -2 1;
 -1 1 0 1 0 1 -1;
 -1 0 -1 0 4 -2 0;
 -1 1 -1 -1 -1 5 -1;
 -1 -1 -1 0 0 0 4];
b2=[32 -41 -2 9 -10 32 -24]';

x=seidla(A2,b2);

function [x]=seidla(A,b)
s=(size(A,1));
g=zeros(s,1);
h=zeros(s,s);
x=zeros(s,1);
status=1;
for i=1:s%sprawdzenie czy aii~=0
if A(i,i)==0
    status=0;
    break;
end
end 

if status==1
for i=1:s
g(i)=b(i)/A(i,i);%wpisanie wspolczynikow g
for j=1:s
    if i==j
        h(i,j)=0;
    else
        h(i,j)=-A(i,j)/A(i,i);%wpisanie h
    end
end
end

x=g;
e=100;%tylko aby weszlo raz do petli
for i=0:1:1000000000000000%obliczanie do osiagniecia dokladnosci ale nie w nieskonczonosc
if e >= 10e-6 && i < 1000000000000000
     xp=x; 
    for j=1:s
        p1=0;
        for k=1:j-1
            p1=p1+h(j,k)*x(k);
        end  
        p2=0;
        for k=j:s
            p2=p2+h(j,k)*xp(k);
        end
        x(j)=g(j)+p1+p2;
    end
      e=norm(x-xp);
    else
        break; % Przerwanie pętli, gdy nie spełniony jest warunek
    end

end
disp(i);
disp(x);
end
end%seidla