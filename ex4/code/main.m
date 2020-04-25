%main
%如要重新读写编码后的中间数据，
%请去掉dlmwrite('dif_code_gray.txt', d);这个语句的注释符号
disp('此程序运行较慢，请耐心等待。');
disp('它将完成以下流程1.灰度图差分编码以及解码结果与原矩阵比对 2.rgb图差分编码 3.将灰度图差分编码的矩阵进行霍夫曼编码');

disp('开始处理灰度图……');
figure;
A=rgb2gray(imread('LenaRGB.tif'));
subplot(1,2,1);imshow(A);
title('原图');
d=dif_code(A);
dlmwrite('dif_code_gray.mat', d);
disp('灰度图差分编码结果已写入dif_code_gray.mat');
A1=dif_decode(d);
bool=compare(A1,A);
if bool==1
    disp('差分解码矩阵与原矩阵完全一致！');
end
subplot(1,2,2);imshow(A1);
title('解码图');

disp('开始处理rgb图……');
figure;
A=imread('LenaRGB.tif');
subplot(1,2,1);imshow(A);
title('原图');
d=dif_code(A);
dlmwrite('dif_code_rgb.mat', d);
disp('rgb图差分编码结果已写入dif_code_rgb.mat');
A1=dif_decode(d);
subplot(1,2,2);imshow(A1);
title('解码图');

disp('开始对灰度图差分编码的矩阵进行霍夫曼编码解码……');
A=rgb2gray(imread('LenaRGB.tif'));
d=dif_code(A);
huffman_process_gray(uint8(d));


disp('灰度图差分编码结果请查看dif_code_gray.mat');
load('dif_code_gray.mat','-ascii');
disp('rgb图差分编码结果请查看dif_code_rgb.mat');
load('dif_code_rgb.mat','-ascii');
disp('灰度图差分编码矩阵的霍夫曼编码结果请查看huffmanenco.mat');
load('huffmanenco.mat','-ascii');
disp('霍夫曼解码结果请查看huffmandeco.mat');
load('huffmandeco.mat','-ascii');

disp('差分编码解码结果比对请查看dif_original.mat和dif_deco.mat');
load('dif_original.mat','-ascii');
load('dif_deco.mat','-ascii');

disp('程序运行完毕');

