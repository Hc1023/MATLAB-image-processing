function[A]=MyRand(m, n)
A=zeros(m,n);
for i=1:m
    for j=1:n
        A(i,j)=rand;
    end
end
