function[Ide]=huffman_process_r(nn,M,N)
[dict_r,enco_r]=binary_read(nn);
%������Ҫ�ѻ����������ɶ������ļ�Ȼ���ȡ�������ļ� fwrite fread
%ÿһ��ͨ�����һ��ѹ���Ķ������ļ�����Ҫ����dict�ֵ��enco����
%dict�ֵ� 256*2����һ�з��ţ��ڶ��л��������룻enco���룬һ��������

% dlmwrite(['huffmanenco' num2str(i) '.mat'], enco);

disp(['�ļ�' num2str(nn) '��ȡ��ɣ����ڽ��н��롭��']);
disp('������̽����������ĵȴ�');

deco = huffmandeco(enco_r,dict_r); %����

Ide = col2im(deco,[M,N],[M,N],'distinct'); %����������ת����ͼ��飻
% dlmwrite('huffmandeco.mat', Ide);
disp(['ͨ��' num2str(nn) '��ȡ���������']);
Ide=double(Ide);
end
