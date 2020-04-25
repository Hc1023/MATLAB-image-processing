function[bool]=compare(A1,A)
bool=1;
dlmwrite('dif_original.mat', A);
dlmwrite('dif_deco.mat', A1);
if size(A1)~=size(A)
    error('输入的两个矩阵大小不匹配！');
end

[a,b,c]=size(A);
for t=1:c
    for i=1:a
        for j=1:b
            if A1(i,j,t)~=A(i,j,t)
                bool=0;
                return
            end
        end
    end
end
end

    