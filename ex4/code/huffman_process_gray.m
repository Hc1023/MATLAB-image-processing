function huffman_process_gray(I)
if numel(size(I))~=2
    error('这不是一张灰度图！');
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
disp('已生成字典，正在对矩阵进行霍夫曼编码，预估耗时20秒……');
enco = huffmanenco(I1,dict); %编码
dlmwrite('huffmanenco.mat', enco);
disp('编码已完成，编码结果已写入huffmanenco.mat，正在进行解码……');
disp('解码过程较慢，预估耗时1分钟，如不需要可按ctrl+c终止程序');
disp('但提前终止程序需要助教手动load前期生成的.mat文件，可复制main结尾部分代码');
deco = huffmandeco(enco,dict); %解码

Ide = col2im(deco,[M,N],[M,N],'distinct'); %把向量重新转换成图像块；
dlmwrite('huffmandeco.mat', Ide);
disp('解码已完成，并已将其重新转换为图像矩阵写入huffmandeco.mat');

end
