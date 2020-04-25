function[sim1]=hash(img,smp,h)
img=rgb2gray(img);
smp=rgb2gray(smp);
img=imresize(img,[h,h]);
smp=imresize(smp,[h,h]);
sim1=0;
for i=1:h
    for j=1:h
        img(i,j)=floor(double(img(i,j))/4);
        smp(i,j)=floor(double(smp(i,j))/4);
    end
end
% img=adjust(img,h);
% smp=adjust(smp,h);  
    
img=dct2(img,32,32);
smp=dct2(smp,32,32);
aver_img=0;
aver_smp=0;
for i=1:h
    for j=1:h
        aver_img=aver_img+img(i,j);
        aver_smp=aver_img+smp(i,j);
    end
end
aver_img=aver_img/(h*h);
aver_smp=aver_smp/(h*h);

for i=1:h
    for j=1:h
        if img(i,j)>=aver_img
            img(i,j)=1;
        else
            img(i,j)=0;
        end
        if smp(i,j)>=aver_smp
            smp(i,j)=1;
        else
            smp(i,j)=0;
        end
    end
end
for i=1:h
    for j=1:h
        if smp(i,j)==img(i,j)
            sim1=sim1+1;
        end
    end
end

sim1=sim1/(h*h);

end

