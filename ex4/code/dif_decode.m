function[A]=dif_decode(d)
[m,n,t]=size(d);

A=zeros(m,n,t);

A(1,1,:)=d(1,1,:);

for i=2:m
    A(i,1,:)=d(i,1,:)+0.5*A(i-1,1,:);
end

for j=2:n
    A(1,j,:)=d(1,j,:)+0.5*A(1,j-1,:);
end

for i=2:m
    for j=2:n
        A(i,j,:)=d(i,j,:)+0.5*A(i-1,j,:)+0.5*A(i,j-1,:);
    end
end
A=uint8(A);

end
