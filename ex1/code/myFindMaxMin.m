function[max,min]=myFindMaxMin(A)
[r,c]=size(A);
max=A(1,1);
min=A(1,1);
for i=1:r
    for j=1:c
        if A(i,j)>max
            max=A(i,j);
        end
        if A(i,j)<min
            min=A(i,j);
        end
    end
end


