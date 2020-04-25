function[JJ,A]=my_filter(I,T)
[m,n]=size(I);
A=zeros(m,n);
Id=double(I);
Id2=padarray(Id,[1 1],'replicate');
for i=1:m
    for j=1:n
        A(i,j)=sum(sum(T.*Id2(i:i+2,j:j+2)));
    end
end
% figure,imshow(A),title('ÂË²¨');
J=Id-A;
JJ=uint8(J);
% figure,imshow(JJ);
end
