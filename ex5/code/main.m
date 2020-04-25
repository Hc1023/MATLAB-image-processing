%灰度图
I1=imread('moon.tif');
T1=[1,1,1;1,-8,1;1,1,1];
[JJ1,A]=my_filter(I1,T1);

figure;
subplot(1,3,1),imshow(I1),title('原图');
subplot(1,3,2),imshow(A),title('滤波');
subplot(1,3,3);imshow(JJ1),title('滤波图');
disp('灰度图处理完成');
%彩图 自己进行三通道赋值
I2=imread('Peppers.png');
[m,n,~]=size(I2);

T2_1=fspecial('laplacian',0.2);
T2_2=fspecial('laplacian',0.5);
T2_3=fspecial('laplacian',1);

JJ2_1=zeros(m,n,3);
for i=1:3
    [JJ2_1(:,:,i),~]=my_filter(I2(:,:,i),T2_1);
end

JJ2_2=zeros(m,n,3);
for i=1:3
    [JJ2_2(:,:,i),~]=my_filter(I2(:,:,i),T2_2);
end

JJ2_3=zeros(m,n,3);
for i=1:3
    [JJ2_3(:,:,i),~]=my_filter(I2(:,:,i),T2_3);
end

figure;
subplot(2,2,1),imshow(I2),title('原图');
subplot(2,2,2),imshow(uint8(JJ2_1)),title('0.2-滤波');
subplot(2,2,3),imshow(uint8(JJ2_2)),title('0.5-滤波');
subplot(2,2,4),imshow(uint8(JJ2_3)),title('1-滤波');
disp('彩图（自己进行三通道滤波）处理完成');
%彩图 用系统函数
I3=imread('Peppers.png');
[m,n,~]=size(I3);

T3_1=fspecial('laplacian',0.2);
T3_2=fspecial('laplacian',0.5);
T3_3=fspecial('laplacian',1);

A_1=imfilter(I3,T3_1,'replicate');
JJ3_1=zeros(m,n,3);
for i=1:3
    JJ3_1(:,:,i)=double(I3(:,:,i))-double(A_1(:,:,i));
end

A_2=imfilter(I3,T3_2,'replicate');
JJ3_2=zeros(m,n,3);
for i=1:3
    JJ3_2(:,:,i)=double(I3(:,:,i))-double(A_2(:,:,i));
end

A_3=imfilter(I3,T3_3,'replicate');
JJ3_3=zeros(m,n,3);
for i=1:3
    JJ3_3(:,:,i)=double(I3(:,:,i))-double(A_3(:,:,i));
end

figure;
subplot(2,2,1),imshow(I3),title('原图');
subplot(2,2,2),imshow(uint8(JJ3_1)),title('0.2-滤波');
subplot(2,2,3),imshow(uint8(JJ3_2)),title('0.5-滤波');
subplot(2,2,4),imshow(uint8(JJ3_3)),title('1-滤波');
disp('彩图（系统函数）处理完成');