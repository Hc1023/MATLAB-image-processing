function[image_bw]=my_rgb2bw(image)
image_gray=my_rgb2gray(image);
[m,n]=size(image_gray);
image_bw=zeros(m,n);

y=my_PixNum(image_gray);
sum=0;
for i=1:256
    sum=y(i)*i+sum;
end
thresh=sum/(m*n);

for i=1:m
    for j=1:n
        if image_gray(i,j)<thresh
            image_bw(i,j)=0;
        else
            image_bw(i,j)=255;
        end
    end
end 

imshow(image_bw);
imwrite(image_bw,'image_bw.jpg')%保存图像为文件
end