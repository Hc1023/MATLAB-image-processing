%���ڽ���ֵ���Ŵ�,nxΪ����Ŵ�����nyΪ����Ŵ���
function[B]=image_zoom1(A,nx,ny)
% imshow(A);%��ʾԭͼ
% title('ԭͼ');
Row=size(A,1);
Col=size(A,2);%ͼ������������

r=round(ny*Row);%����任�����������ֵ
c=round(nx*Col);
B=zeros(r,c,3);%����任���ͼ��
for i=1:r  %��
  for j=1:c  %��
     x=round(j/nx);%����仯��
     y=round(i/ny);%����仯��
     %�����Ե
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
B=uint8(B);%������ת����8λ�޷������� 
% figure;
% imshow(B);
% title('���ڽ���ֵ�㷨');
end
