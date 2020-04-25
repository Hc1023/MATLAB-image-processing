function[B]=image_zoom2(A,nx,ny)
% imshow(A);%显示原图
% title('原图');
Row=size(A,1);
Col=size(A,2);%图像行数和列数

r=round(ny*Row);%求出变换后的坐标的最大值
c=round(nx*Col);
B=zeros(r,c,3);%定义变换后的图像

for i=1:r
  for j=1:c
      
      x=j/nx;y=i/ny;
      x1=floor(x);x2=x1+1;
      y1=floor(y);y2=y1+1;%最小临近法对图像进行插值

      a=(x-x1)/(x2-x1);b=(x2-x)/(x2-x1);
      cc=(y-y1)/(y2-y1);d=(y2-y)/(y2-y1);
      %处理边缘
      if x1==0
         x1=1;
      end
      if y1==0 
         y1=1;
      end
      if x2>Col 
         x2=Col;x1=Col;
      end
      if y2>Row 
         y2=Row;y1=Col;
      end

       B(i,j,:)=(A(y1,x1,:)*b+A(y1,x2,:)*a)*d+(A(y2,x1,:)*b+A(y2,x2,:)*a)*cc;
       
  end      
end

B=uint8(B);
% figure;
% imshow(B);
% title('双线性插值算法');
end
