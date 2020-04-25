function[Ide]=huffman_process_r(nn,M,N)
[dict_r,enco_r]=binary_read(nn);
%这里需要把霍夫曼编码存成二进制文件然后读取二进制文件 fwrite fread
%每一个通道存成一个压缩的二进制文件，需要存入dict字典和enco编码
%dict字典 256*2，第一列符号，第二列霍夫曼编码；enco编码，一个列向量

% dlmwrite(['huffmanenco' num2str(i) '.mat'], enco);

disp(['文件' num2str(nn) '读取完成，正在进行解码……']);
disp('解码过程较慢，请耐心等待');

deco = huffmandeco(enco_r,dict_r); %解码

Ide = col2im(deco,[M,N],[M,N],'distinct'); %把向量重新转换成图像块；
% dlmwrite('huffmandeco.mat', Ide);
disp(['通道' num2str(nn) '读取、解码完成']);
Ide=double(Ide);
end
