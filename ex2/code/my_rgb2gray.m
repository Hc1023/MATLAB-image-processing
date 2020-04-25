function[image_gray]=my_rgb2gray(image)
image_r=image(:,:,1);
image_g=image(:,:,2);
image_b=image(:,:,3);
image_gray=0.2989 * image_r + 0.5870 * image_g + 0.1140 * image_b;
imshow(image_gray);
imwrite(image_gray,'image_gray.jpg')%保存图像为文件
end
