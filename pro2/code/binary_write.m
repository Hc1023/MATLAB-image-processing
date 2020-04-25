function binary_write(dict,enco,nn)
%´æ´¢×ÖµäÎª.mat
% len=256;
% for i=1:256
%     len=len+length(dict{i,2});
% end
dict_matrix=[];
for i=1:256
    dict_matrix=[dict_matrix,length(dict{i,2}),dict{i,2}(1,:)];
end
% dlmwrite(['dict_matrix' num2str(nn) '.mat'], dict_matrix);
fid = fopen(['dict_matrix' num2str(nn) '.bin'],'wb');
fwrite(fid, dict_matrix,'uchar');
fclose(fid);
%enco´æ´¢±àÂëÎª.bin
n1=floor(length(enco)/8);
n2=rem(length(enco),8);
enco_w=zeros(n1+2,1);
for i=1:n1
    enco_w(i)=0;
    for j=1:8
        enco_w(i)=enco_w(i)+(enco(8*(i-1)+j))*2^(j-1);
    end
end
enco_w(n1+1)=0;
for j=1:n2
    enco_w(n1+1)=enco_w(n1+1)+enco(8*n1+j)*2^(j-1);
end
enco_w(n1+2)=n2;

fid = fopen(['enco_w' num2str(nn) '.bin'],'wb');
fwrite(fid, enco_w,'uchar');
fclose(fid);
end
