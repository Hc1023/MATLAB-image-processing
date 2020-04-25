function[sim_shape2]=match_shape2(M,N)
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
[Ir,Ic]=size(I);
[Jr,Jc]=size(J);
%行分割为3块
Ir1=I(1:round(Ir/3),:);
Ir2=I((Ir-round(Ir/2)):round(Ir/3*2),:);
Ir3=I((Ir-round(Ir/3*2)):Ir,:);

Jr1=J(1:round(Jr/2),:);
Jr2=J((Jr-round(Jr/2)):round(Jr/3*2),:);
Jr3=J((Jr-round(Jr/3*2)):Jr,:);

HistDistR1=match_shape(Ir1,Jr1);
HistDistR2=match_shape(Ir2,Jr2);
HistDistR3=match_shape(Ir3,Jr3);

%列分割为3块
Ic1=I(:,1:round(Ic/3));
Ic2=I(:,(Ic-round(Ic/2)):round(Ic/3*2));
Ic3=I(:,(Ic-round(Ic/3*2)):Ic);

Jc1=J(:,1:round(Jc/2));
Jc2=J(:,(Jc-round(Jc/2)):round(Jc/3*2));
Jc3=J(:,(Jc-round(Jc/3*2)):Jc);

HistDistC1=match_shape(Ic1,Jc1);
HistDistC2=match_shape(Ic2,Jc2);
HistDistC3=match_shape(Ic3,Jc3);

%总分割为4块
Ia1=I(1:round(Ir/2),1:round(Ic/2));
Ia2=I(1:round(Ir/2),round(Ic/2):Ic);
Ia3=I(Ir-round(Ir/2):Ir,1:round(Ic/2));
Ia4=I(Ir-round(Ir/2):Ir,round(Ic/2):Ic);

Ja1=J(1:round(Jr/2),1:round(Jc/2));
Ja2=J(1:round(Jr/2),round(Jc/2):Jc);
Ja3=J(Jr-round(Jr/2):Jr,1:round(Jc/2));
Ja4=J(Jr-round(Jr/2):Jr,round(Jc/2):Jc);

HistDistA1=match_shape(Ia1,Ja1);
HistDistA2=match_shape(Ia2,Ja2);
HistDistA3=match_shape(Ia3,Ja3);
HistDistA4=match_shape(Ia4,Ja4);


HistDistR=(HistDistR1+HistDistR2+HistDistR3)/3;
HistDistC=(HistDistC1+HistDistC2+HistDistC3)/3;
HistDistA=(HistDistA1+HistDistA2+HistDistA3+HistDistA4)/4;

sim_shape2=(HistDistR+HistDistC+HistDistA)/3;

end

