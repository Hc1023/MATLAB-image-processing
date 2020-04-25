function[d]=dif_code(A)
[m,n,t]=size(A);
A=double(A);
dx=zeros(m,n,t);
dy=zeros(m,n,t);

for i=1:m
    for j=1:n
        if i==1
            dx(i,j,:)=A(i,j,:);
        else
            dx(i,j,:)=A(i,j,:)-A(i-1,j,:);
        end
    end
end

for i=1:m
    for j=1:n
        if j==1
            dy(i,j,:)=A(i,j,:);
        else
            dy(i,j,:)=A(i,j,:)-A(i,j-1,:);
        end
    end
end

d=0.5*dx+0.5*dy;

end

