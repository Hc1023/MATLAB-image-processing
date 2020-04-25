function[sim_total]=process_sim(N)
imgPath='./dataset/';%图像库路径
imgDir=dir([imgPath,'*.png']);%遍历所有png格式的图片
len=length(imgDir);
sim_total=zeros(1,len);
sim=zeros(1,len);
sim_shape=zeros(1,len);
for i=1:len
    if rem(i,4)==0
        sim(i)=0;%数据集提供的灰度图我不作为参考依据
    else
        img=imread([imgPath imgDir(i).name]);
        [a,b,~]=size(img);
        img=img(ceil(0.1*a):floor(0.9*a),ceil(0.1*b):floor(0.9*b),:);
        sim(i)=match2(img,N);
        sim_shape(i)=match_shape(img,N);
        sim_total(i)=0.8*sim(i)+0.2*sim_shape(i)+0.1*hash(img,N,8);
%         dlmwrite(['match_sim' num2str(i) '.mat'], sim(i));
%         load(['match_sim' num2str(i) '.mat'],['sim' i],-ascii');
    end    
end

end
