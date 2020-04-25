%Ҫ��ͼ��r��cΪ8�ı�����ͼ��Ϊrgbͼ
%1.ͼ������С��ѹ�� 2.ͼ�����С��ѹ�� 
% I=imread('LenaRGB.tif');
% I=imread('BaboonRGB.tif');
I=imread('PeppersRGB.tif');

[r,c,t]=size(I);
if rem(r,8)~=0||rem(c,8)~=0||t~=3
    error('ͼ�񲻷���ѹ��Ҫ��');
end

% subplot(2,2,1),imshow(I),title('ԭͼ');

T=row_ortho(r);
Id=double(I);
Jd(:,:,1)=T*Id(:,:,1);Jd(:,:,2)=T*Id(:,:,2);Jd(:,:,3)=T*Id(:,:,3);
%���Ͼ���double���о�������
J=uint8(Jd);
% subplot(2,2,2),imshow(J),title('����ѹ��ͼ');
%ͼ������С��ѹ�����

T1=row_ortho(c);
JJd(:,:,1)=Jd(:,:,1)*T1';JJd(:,:,2)=Jd(:,:,2)*T1';JJd(:,:,3)=Jd(:,:,3)*T1';
%���Ͼ���double���о�������
JJ=uint8(JJd);
% subplot(2,2,3),imshow(JJ),title('ѹ��ͼ');
%ͼ�����С��ѹ�����
%����HaarС�����б��룬�õ��м������ļ����洢
dlmwrite('Jr.mat', J(:,:,1));dlmwrite('Jg.mat', J(:,:,2));dlmwrite('Jb.mat', J(:,:,3));
dlmwrite('JJr.mat', JJ(:,:,1));dlmwrite('JJg.mat', JJ(:,:,2));dlmwrite('JJb.mat', JJ(:,:,3));
load('Jr.mat','-ascii');load('Jg.mat','-ascii');load('Jb.mat','-ascii');
load('JJr.mat','-ascii');load('JJg.mat','-ascii');load('JJb.mat','-ascii');

%�����������ٴӶ������ļ��ж�ȡ��JJd_deco
JJd_deco=zeros(r,c,3);
disp('��ʼ����洢');
for i=1:3
    huffman_process_w(uint8(JJd(:,:,i)),i);
end
disp('��ʼ��ȡ����');
for i=1:3
    JJd_deco(:,:,i)=huffman_process_r(i,r,c);
end
%JJd_deco(:,:,t)��JJd(:,:,t)��Ԫ�ض���double�͵�
%������Ҫ��JJd���н���
Jd_deco(:,:,1)=JJd_deco(:,:,1)/(T1');Jd_deco(:,:,2)=JJd_deco(:,:,2)/(T1');Jd_deco(:,:,3)=JJd_deco(:,:,3)/(T1');
J_deco=uint8(Jd_deco);
%����ԭ���
%����ԭ����ȶ�
% compare(J_deco,J);

% Jd(:,:,1)=T*Id(:,:,1);Jd(:,:,2)=T*Id(:,:,2);Jd(:,:,3)=T*Id(:,:,3);
Id_deco(:,:,1)=T\Jd_deco(:,:,1);Id_deco(:,:,2)=T\Jd_deco(:,:,2);Id_deco(:,:,3)=T\Jd_deco(:,:,3);
I_deco=uint8(Id_deco);
% compare(I_deco,I);   ����ѹ��������
% subplot(2,2,4),imshow(I_deco),title('��ԭͼ');
%����ԭ���
%����ԭ����ȶ�
disp('�����������');
subplot(2,2,1),imshow(I),title('ԭͼ');
subplot(2,2,2),imshow(J),title('����ѹ��ͼ');
subplot(2,2,3),imshow(JJ),title('ѹ��ͼ');
subplot(2,2,4),imshow(I_deco),title('��ԭͼ');

