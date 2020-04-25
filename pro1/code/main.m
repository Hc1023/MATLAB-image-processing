imgPath='./test/';%图像库路径
imgDir=dir([imgPath,'*.*']);%遍历
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

% imgPath='./test/';%图像库路径
% imgDir=dir([imgPath,'*.*']);%遍历
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

% %如果老师的测试图全为png格式，而上面的代码运行有错误（在我的电脑上测试是没问题的），可换用下面代码
% imgPath='./test/';%图像库路径
% imgDir=dir([imgPath,'*.png']);%遍历所有png格式的图片
% len=length(imgDir);   
% for i=1:len
%     N=imread([imgPath num2str(i) '.png']);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
%     disp(i);
% end

% %仅用于测试数据库
% imgPath='./test/';%图像库路径
% imgDir=dir([imgPath,'*.png']);%遍历所有png格式的图片
% len=length(imgDir);   
% for i=1:len
%     N=imread([imgPath imgDir(i).name]);
%     sim=process_sim(N);
%     my_ans=sim_to_ans(sim);
%     print_text(my_ans);
%     disp(imgDir(i).name);
% end

    