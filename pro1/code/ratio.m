function[r]=ratio(M)
if numel(size(M))==3
    M1=rgb2gray(M);
else
    M1=M;
end

% [r,c]=size(M1);
% M1=M(round(0.01*r):round(0.99*r),round(0.01*c):round(0.99*c));

M2=filter2(fspecial('average',[9,9]),M1)/255;%均值滤波，为了色块处理
thresh_M = graythresh(M1);
M3=imbinarize(M2,thresh_M);%二值化后图像色块
% figure,imshow(M3);

% BW=imbinarize(uint8(M3));
BW2 = bwperim(M3,8);%二值化后图像轮廓边界
% figure,imshow(BW2);

% IBW = ~BW;F1 = imfill(IBW,'holes');SE = ones(3);F2 = imdilate(F1,SE,'same');BW3 = bwperim(F2);
% figure,imshow(BW3),title('operated bwperim'); 

area=sum(sum(M3==1));
perimeter=sum(sum(BW2==1));

r=area/(perimeter*perimeter);
% disp(r);
end