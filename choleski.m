clc
clear all
close all
A = [5, -1, 0; -1, 6, 2; 0, 2, 7];
b=[3;-3;32];
[m, n] = size(A);
B=zeros(n,n);
C=zeros(n,n);
y=zeros(n,1);
x=zeros(n,1);
for i=1:n%1kolumna B
    B(i,1)=A(i,1);
end
for j=1:n%1 wiersz C
    C(1,j)=A(1,j)/B(1,1); 
end
for i=2:n%wyznacznie B i C
    for j=2:i
        p=0;
        for k=1:j-1
            p=p+B(i,k)*C(k,j);
        end
        B(i,j)=(A(i,j)-p); 
    end
    for z=i:n
        p=0;
        if i==z
        C(i,z)=1;
        else
            for k=1:i-1
                p=p+B(i,k)*C(k,z);
            end
            C(i,z)=(A(i,z)-p)/(B(i,i));
        end
    end
end
%oblicznie y
y(1)=b(1,1)/B(1,1);
for i=2:n
    p=0;
    for k=1:i-1
        p=p+B(i,k)*y(k);
    end
    y(i)=(b(i,1)-p)/(B(i,i));
end
%oblicznie x
x(n)=y(n);
for i=n-1:-1:1
    p=0;
    for k=i+1:n
        p=p+C(i,k)*x(k);
    end
    x(i)=y(i)-p;

end