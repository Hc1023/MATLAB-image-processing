function[B]=mySortMatrix(A)
[m,n]=size(A);
B=zeros(1,m*n);
k=1;
for i=1:m
    for j=1:n
        B(1,k)=A(i,j);
        k=k+1;
    end
end

for i=1:(m*n-1)
    for j=1:(m*n-i)
        if B(1,j+1)<B(1,j)
            temp=B(1,j+1);
            B(1,j+1)=B(1,j);
            B(1,j)=temp;
        end
    end
end



