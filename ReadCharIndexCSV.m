% 构建查找表以帮助特征训练时快速找到文字索引
fid = fopen('Char_Index.txt');

tline = fgets(fid);
v=[]
while ischar(tline)
    disp(tline)
    tline = fgets(fid); % 正好跳过第一个不需要的“序号 类别编号 对应图片”
    if ischar(tline)
        c=strsplit(tline)
        c{1} % 4为自然序号，显然用不着
        c{2} % 实际的文字索引直接写入向量
        v=[v,str2num(c{2})]
    end
end
fclose(fid);
v
