function huffman_process_w(I,nn)
if numel(size(I))~=2
    error('这不是一张二维图！');
end
[M,N] = size(I);
I1 = I(:);
P = zeros(1,256);
%获取各符号的概率；
for i = 0:255
     P(i+1) = length(find(I1 == i))/(M*N);
end

k = 0:255;
dict = huffmandict(k,P); %生成字典 
disp(['已生成字典' num2str(nn) '，正在对矩阵进行霍夫曼编码……']);
enco = huffmanenco(I1,dict); %编码

binary_write(dict,enco,nn);
disp(['字典' num2str(nn) '编码' num2str(nn) '已存储']);

end
