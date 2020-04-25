function[B]=image_zoom2(A,nx,ny)
% imshow(A);%��ʾԭͼ
% title('ԭͼ');
Row=size(A,1);
Col=size(A,2);%ͼ������������

r=round(ny*Row);%����任�����������ֵ
c=round(nx*Col);
B=zeros(r,c,3);%����任���ͼ��

for i=1:r
  for j=1:c
      
      x=j/nx;y=i/ny;
      x1=floor(x);x2=x1+1;
      y1=floor(y);y2=y1+1;%��С�ٽ�����ͼ����в�ֵ

      a=(x-x1)/(x2-x1);b=(x2-x)/(x2-x1);
      cc=(y-y1)/(y2-y1);d=(y2-y)/(y2-y1);
      %�����Ե
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
% title('˫���Բ�ֵ�㷨');
end
