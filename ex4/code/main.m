%main
%��Ҫ���¶�д�������м����ݣ�
%��ȥ��dlmwrite('dif_code_gray.txt', d);�������ע�ͷ���
disp('�˳������н����������ĵȴ���');
disp('���������������1.�Ҷ�ͼ��ֱ����Լ���������ԭ����ȶ� 2.rgbͼ��ֱ��� 3.���Ҷ�ͼ��ֱ���ľ�����л���������');

disp('��ʼ����Ҷ�ͼ����');
figure;
A=rgb2gray(imread('LenaRGB.tif'));
subplot(1,2,1);imshow(A);
title('ԭͼ');
d=dif_code(A);
dlmwrite('dif_code_gray.mat', d);
disp('�Ҷ�ͼ��ֱ�������д��dif_code_gray.mat');
A1=dif_decode(d);
bool=compare(A1,A);
if bool==1
    disp('��ֽ��������ԭ������ȫһ�£�');
end
subplot(1,2,2);imshow(A1);
title('����ͼ');

disp('��ʼ����rgbͼ����');
figure;
A=imread('LenaRGB.tif');
subplot(1,2,1);imshow(A);
title('ԭͼ');
d=dif_code(A);
dlmwrite('dif_code_rgb.mat', d);
disp('rgbͼ��ֱ�������д��dif_code_rgb.mat');
A1=dif_decode(d);
subplot(1,2,2);imshow(A1);
title('����ͼ');

disp('��ʼ�ԻҶ�ͼ��ֱ���ľ�����л�����������롭��');
A=rgb2gray(imread('LenaRGB.tif'));
d=dif_code(A);
huffman_process_gray(uint8(d));


disp('�Ҷ�ͼ��ֱ�������鿴dif_code_gray.mat');
load('dif_code_gray.mat','-ascii');
disp('rgbͼ��ֱ�������鿴dif_code_rgb.mat');
load('dif_code_rgb.mat','-ascii');
disp('�Ҷ�ͼ��ֱ������Ļ�������������鿴huffmanenco.mat');
load('huffmanenco.mat','-ascii');
disp('��������������鿴huffmandeco.mat');
load('huffmandeco.mat','-ascii');

disp('��ֱ���������ȶ���鿴dif_original.mat��dif_deco.mat');
load('dif_original.mat','-ascii');
load('dif_deco.mat','-ascii');

disp('�����������');

