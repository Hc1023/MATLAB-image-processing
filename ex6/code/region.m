function region(I)
figure;
subplot(2,2,1);
imshow(I),title('原始图像');
[B,L] = bwboundaries(I); %提取边界
s=length(unique(L));
t=zeros(1,s-1);
for i=1:s-1
t(i)=length(find(L==i));
end
[~,b]=sort(t,'descend');
for i=1:3
    D=B{b(i),1};
    subplot(2,2,i+1);
    plot(D(:,2),D(:,1)); 
    set(gca,'YDir','reverse') %翻转y 坐标轴
    title(['边界标记后图像' num2str(i)]);
end
figure;
[r,c]=size(L);
for i=1:r
    for j=1:c
        if L(i,j)~=b(1)&&L(i,j)~=b(2)&&L(i,j)~=b(3)
            L(i,j)=0;
        end
    end
end
imshow(label2rgb(L, @jet, [.5 .5 .5]));
end

    
