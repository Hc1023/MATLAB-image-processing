function image_zoom(A,nx,ny)

B1=image_zoom1(A,nx,ny);
B2=image_zoom2(A,nx,ny);

imshow(A);%��ʾԭͼ
title('ԭͼ');

figure;
imshow(B1);
title('���ڽ���ֵ�㷨');

figure;
imshow(B2);
title('˫���Բ�ֵ�㷨');

end