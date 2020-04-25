function straight_line(I)
figure;
subplot(1,3,1),imshow(I);
BW = edge(I,'canny');%Canny������ȡͼ��߽磬���ض�ֵͼ��(�߽�1,����0)
[H,T,R] = hough(BW);%�����ֵͼ��ı�׼����任��HΪ����任����I,RΪ�������任�ĽǶȺͰ뾶ֵ
subplot(1,3,2);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');%hough�任��ͼ��
xlabel('\theta'), ylabel('\rho');
axis on,axis square,hold on;
P  = houghpeaks(H,3);%��ȡ3����ֵ��,�������ֱ����ζ�����ڸ�theta rho���еĵ����
x = T(P(:,2)); 
y = R(P(:,1));
plot(x,y,'s','color','white');%�����ֵ��
lines=houghlines(BW,T,R,P);%��ȡ�߶�
subplot(1,3,3);
imshow(I), hold on;
for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');%�����߶�
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');%���
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');%�յ�
end
end