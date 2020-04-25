function[HistDist]=match(M,N)
if length(size(M))==3
    I=rgb2gray(M);
else
    I=M;
end 

if length(size(N))==3
    J=rgb2gray(N);
else
    J=N;
end

[Count1,~]=imhist(I);[Count2,~]=imhist(J);
rCount1=zeros(13,1);rCount2=zeros(13,1);
for i=1:12
    rCount1(i)=sum(Count1((20*(i-1)+1):20*i));
end
rCount1(13)=sum(Count1(20*i+1:256));
for i=1:12
    rCount2(i)=sum(Count2((20*(i-1)+1):20*i));
end
rCount2(13)=sum(Count2(20*i+1:256));


Sum1=sum(rCount1);Sum2=sum(rCount2);
rCount1_norm=rCount1/Sum1;rCount2_norm=rCount2/Sum2;

cos_theta=rCount1_norm'*rCount2_norm/(norm(rCount1_norm)*norm(rCount2_norm));
HistDist=cos_theta;
% Sumup = sqrt(Count1.*Count2);
% SumDown = sqrt(Sum1*Sum2);
% Sumup = sum(Sumup);
% 
% HistDist=1-sqrt(1-Sumup/SumDown);

end

