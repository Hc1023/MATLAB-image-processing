image=imread('PeppersRGB','tif');
figure;
image_gray=my_rgb2gray(image);%真彩色->灰度图像
figure;
my_PixNum(image_gray);%统计一张灰度图像中每一个像素值的数量并输出二维统计图形
figure;
image_bw=my_rgb2bw(image);%真彩色->二值图像
figure;
my_bwNum(image_bw);%统计一张二值图像中的0/1像素数量并输出二维统计图形
