function image_zoom(A,nx,ny)

B1=image_zoom1(A,nx,ny);
B2=image_zoom2(A,nx,ny);

imshow(A);%显示原图
title('原图');

figure;
imshow(B1);
title('最邻近插值算法');

figure;
imshow(B2);
title('双线性插值算法');

end