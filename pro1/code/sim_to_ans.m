function[my_ans]=sim_to_ans(sim)
ans_list=["Argentina","Australia","Belgium","Brazil","Colombia","CostaRica","Croatia",...
    "Denmark","Egypt","France","Germany","Iceland","Iran","Japan","Korea","Mexico","Morocco",...
    "Nigeria","Panama","Peru","Poland","Portugal","Russia","SaudiArabia","Senegal","Serbia",...
    "Spain","Sweden","Switzerland","Tunisia","UnitedKingdom","Uruguay"];
%���ݿ��У����ǲ��ܻҶ�ͼ��ÿ����ͼƬΪһ���ȼ��࣬�ȼ�������ѡ��һ���ǵ���ͼƬ����ѡ��һ

[a,b]=sort(sim,'descend');
if a(1)>0.99
    my_ans=ans_list(ceil(b(1)/4));
    return;
end

p_weight=128:(-1):1;
[b,p]=sort(sim,'descend');
sim_w=b.*p_weight./128;

p_ans_index=ceil(p/4);

country_sim=zeros(1,32);
for i=1:32
    country_sim(p_ans_index(i))=country_sim(p_ans_index(i))+sim_w(i);
end

[m,i] = max(country_sim);
if m>0.5
    my_ans=ans_list(i);%my_ansΪ�ַ�������
else
    my_ans="no";
end

end

 