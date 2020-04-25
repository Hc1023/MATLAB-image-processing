function huffman_process_w(I,nn)
if numel(size(I))~=2
    error('�ⲻ��һ�Ŷ�άͼ��');
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
disp(['�������ֵ�' num2str(nn) '�����ڶԾ�����л��������롭��']);
enco = huffmanenco(I1,dict); %����

binary_write(dict,enco,nn);
disp(['�ֵ�' num2str(nn) '����' num2str(nn) '�Ѵ洢']);

end
