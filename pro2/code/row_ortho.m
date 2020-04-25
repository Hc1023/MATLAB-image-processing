function[T]=row_ortho(r)
T=zeros(r,r);
for i=1:r/8
    for j=1:8
        T(i,8*(i-1)+j)=1/8;
    end
end
for i=1:r/8
    for j=1:4
        T(i+r/8,8*(i-1)+j)=1/8;
        T(i+r/8,8*(i-1)+j+4)=-1/8;
    end
end
for i=1:r/4
    for j=1:2
        T(i+r/4,4*(i-1)+j)=1/4;
        T(i+r/4,4*(i-1)+j+2)=-1/4;
    end
end
for i=1:r/2
    T(i+r/2,2*(i-1)+1)=1/2;
    T(i+r/2,2*(i-1)+2)=-1/2;
end
end

