function print_text(my_ans)
fid=fopen('ans.txt','at');%д���ļ�·������ʵ�ֻ���
fprintf(fid,'%s\n',my_ans);
fclose(fid);
end

