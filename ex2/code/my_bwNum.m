function[y]=my_bwNum(image_bw)
y=zeros(1,2);
y(1)=sum(sum(image_bw==0)); 
y(2)=sum(sum(image_bw==255)); 
b=bar(y,'grouped');
title('bwNum');
saveas(b,'my_bwNum.jpg');
end
