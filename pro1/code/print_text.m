function print_text(my_ans)
fid=fopen('ans.txt','at');%写入文件路径并能实现换行
fprintf(fid,'%s\n',my_ans);
fclose(fid);
end

