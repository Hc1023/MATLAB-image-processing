%要求图像r，c为8的倍数，图像为rgb图
%1.图像纵向小波压缩 2.图像横向小波压缩 
% I=imread('LenaRGB.tif');
% I=imread('BaboonRGB.tif');
I=imread('PeppersRGB.tif');

[r,c,t]=size(I);
if rem(r,8)~=0||rem(c,8)~=0||t~=3
    error('图像不符合压缩要求！');
end

% subplot(2,2,1),imshow(I),title('原图');

T=row_ortho(r);
Id=double(I);
Jd(:,:,1)=T*Id(:,:,1);Jd(:,:,2)=T*Id(:,:,2);Jd(:,:,3)=T*Id(:,:,3);
%以上均用double进行矩阵运算
J=uint8(Jd);
% subplot(2,2,2),imshow(J),title('纵向压缩图');
%图像纵向小波压缩完成

T1=row_ortho(c);
JJd(:,:,1)=Jd(:,:,1)*T1';JJd(:,:,2)=Jd(:,:,2)*T1';JJd(:,:,3)=Jd(:,:,3)*T1';
%以上均用double进行矩阵运算
JJ=uint8(JJd);
% subplot(2,2,3),imshow(JJ),title('压缩图');
%图像横向小波压缩完成
%利用Haar小波进行编码，得到中间数据文件，存储
dlmwrite('Jr.mat', J(:,:,1));dlmwrite('Jg.mat', J(:,:,2));dlmwrite('Jb.mat', J(:,:,3));
dlmwrite('JJr.mat', JJ(:,:,1));dlmwrite('JJg.mat', JJ(:,:,2));dlmwrite('JJb.mat', JJ(:,:,3));
load('Jr.mat','-ascii');load('Jg.mat','-ascii');load('Jb.mat','-ascii');
load('JJr.mat','-ascii');load('JJg.mat','-ascii');load('JJb.mat','-ascii');

%霍夫曼编码再从二进制文件中读取出JJd_deco
JJd_deco=zeros(r,c,3);
disp('开始编码存储');
for i=1:3
    huffman_process_w(uint8(JJd(:,:,i)),i);
end
disp('开始读取解码');
for i=1:3
    JJd_deco(:,:,i)=huffman_process_r(i,r,c);
end
%JJd_deco(:,:,t)和JJd(:,:,t)的元素都是double型的
%下面需要对JJd进行解码
Jd_deco(:,:,1)=JJd_deco(:,:,1)/(T1');Jd_deco(:,:,2)=JJd_deco(:,:,2)/(T1');Jd_deco(:,:,3)=JJd_deco(:,:,3)/(T1');
J_deco=uint8(Jd_deco);
%横向还原完成
%横向还原矩阵比对
% compare(J_deco,J);

% Jd(:,:,1)=T*Id(:,:,1);Jd(:,:,2)=T*Id(:,:,2);Jd(:,:,3)=T*Id(:,:,3);
Id_deco(:,:,1)=T\Jd_deco(:,:,1);Id_deco(:,:,2)=T\Jd_deco(:,:,2);Id_deco(:,:,3)=T\Jd_deco(:,:,3);
I_deco=uint8(Id_deco);
% compare(I_deco,I);   有损压缩！！！
% subplot(2,2,4),imshow(I_deco),title('还原图');
%纵向还原完成
%纵向还原矩阵比对
disp('程序运行完毕');
subplot(2,2,1),imshow(I),title('原图');
subplot(2,2,2),imshow(J),title('纵向压缩图');
subplot(2,2,3),imshow(JJ),title('压缩图');
subplot(2,2,4),imshow(I_deco),title('还原图');

