imgPath='./test/';%ͼ���·��
imgDir=dir([imgPath,'*.*']);%����
len=length(imgDir);  
imgDir=imgDir(3:len);
len=length(imgDir);
for i=1:len
    N=imread([imgPath imgDir(i).name]);
    sim=process_sim(N);
    my_ans=sim_to_ans(sim);
    print_text(my_ans);
    disp(imgDir(i).name);
end

% imgPath='./test/';%ͼ���·��
% imgDir=dir([imgPath,'*.*']);%����
% len=length(imgDir);
% imgDir=imgDir(3:len);
% len=length(imgDir);
% 
% n=floor(len/10);
% for i=1:n
%     N=imread([imgPath imgDir(11*(i-1)+1).name]);
%     disp(imgDir(11*(i-1)+1).name);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
% end
% 
% for i=(len-(9-n)+1):len
%     N=imread([imgPath imgDir(i).name]);
%     disp(imgDir(i).name);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
% end
% 
% for i=1:(n-1)
%     for j=1:10
%         N=imread([imgPath imgDir(11*(i-1)+1+j).name]);
%         disp(imgDir(11*(i-1)+1+j).name);
%         sim=process_sim(N);
%         my_ans=sim_to_ans(sim);
%         print_text(my_ans);
%     end
% end
% 
% for i=(11*(n-1)+2):(11*(n-1)+2+rem(len,10))
%     N=imread([imgPath imgDir(i).name]);
%     disp(imgDir(i).name);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
% end

% %�����ʦ�Ĳ���ͼȫΪpng��ʽ��������Ĵ��������д������ҵĵ����ϲ�����û����ģ����ɻ����������
% imgPath='./test/';%ͼ���·��
% imgDir=dir([imgPath,'*.png']);%��������png��ʽ��ͼƬ
% len=length(imgDir);   
% for i=1:len
%     N=imread([imgPath num2str(i) '.png']);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
%     disp(i);
% end

% %�����ڲ������ݿ�
% imgPath='./test/';%ͼ���·��
% imgDir=dir([imgPath,'*.png']);%��������png��ʽ��ͼƬ
% len=length(imgDir);   
% for i=1:len
%     N=imread([imgPath imgDir(i).name]);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
%     disp(imgDir(i).name);
% end

    