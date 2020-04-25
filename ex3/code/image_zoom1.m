%最邻近插值法放大,nx为横向放大倍数，ny为纵向放大倍数
function[B]=image_zoom1(A,nx,ny)
% imshow(A);%显示原图
% title('原图');
Row=size(A,1);
Col=size(A,2);%图像行数和列数

r=round(ny*Row);%求出变换后的坐标的最大值
c=round(nx*Col);
B=zeros(r,c,3);%定义变换后的图像
for i=1:r  %行
  for j=1:c  %列
     x=round(j/nx);%横向变化列
     y=round(i/ny);%纵向变化行
     %处理边缘
     if x==0 
         x=1;
     end
     if y==0 
         y=1;
     end
     if x>Row 
         x=Row;
     end
     if y>Col 
         y=Col;
     end
     B(i,j,:)=A(y,x,:);
   end
end
B=uint8(B);%将矩阵转换成8位无符号整数 
% figure;
% imshow(B);
% title('最邻近插值算法');
end
