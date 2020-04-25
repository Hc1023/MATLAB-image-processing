function huffman_process_gray(I)
if numel(size(I))~=2
    error('�ⲻ��һ�ŻҶ�ͼ��');
end
[M,N] = size(I);
I1 = I(:);
P = zeros(1,256);
%��ȡ�����ŵĸ��ʣ�
for i = 0:255
     P(i+1) = length(find(I1 == i))/(M*N);
end

k = 0:255;
dict = huffmandict(k,P); %�����ֵ� 
disp('�������ֵ䣬���ڶԾ�����л��������룬Ԥ����ʱ20�롭��');
enco = huffmanenco(I1,dict); %����
dlmwrite('huffmanenco.mat', enco);
disp('��������ɣ���������д��huffmanenco.mat�����ڽ��н��롭��');
disp('������̽�����Ԥ����ʱ1���ӣ��粻��Ҫ�ɰ�ctrl+c��ֹ����');
disp('����ǰ��ֹ������Ҫ�����ֶ�loadǰ�����ɵ�.mat�ļ����ɸ���main��β���ִ���');
deco = huffmandeco(enco,dict); %����

Ide = col2im(deco,[M,N],[M,N],'distinct'); %����������ת����ͼ��飻
dlmwrite('huffmandeco.mat', Ide);
disp('��������ɣ����ѽ�������ת��Ϊͼ�����д��huffmandeco.mat');

end
