function[dict_r,enco_r]=binary_read(nn)
%¶ÁÈ¡×Öµä
% A=load(['dict_matrix' num2str(nn) '.mat'],'-ascii');
fid=fopen(['dict_matrix' num2str(nn) '.bin'],'rb');
[A,~]=fread(fid,inf,'uchar');
fclose(fid);
count=1;
dict_r=cell(256,2);
for i=1:256
    dict_r{i,1}=i-1;
    n=A(count);
    B=zeros(1,n);
    for j=1:n
        B(j)=A(count+j); 
    end
    dict_r{i,2}=B;
    count=count+n+1;
end
%¶ÁÈ¡±àÂë
fid=fopen(['enco_w' num2str(nn) '.bin'],'rb');
[enco_rw,~]=fread(fid,inf,'uchar');
fclose(fid);

n1=length(enco_rw)-2;
n2=enco_rw(n1+2);
enco_r=zeros(n1*8+n2,1);

for i=1:n1
    temp=enco_rw(i);
    for j=1:8
        enco_r(8*(i-1)+j)=rem(temp,2);
        temp=floor(temp/2);
    end
end

temp=enco_rw(n1+1);
for j=1:n2
    enco_r(8*n1+j)=rem(temp,2);
    temp=floor(temp/2);
end

end
