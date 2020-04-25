function[bool]=is32(sim)
len=length(sim);
for i=1:len
    if sim(i)>0.2
        bool=1;
        return
    end
end
bool=0;
end
