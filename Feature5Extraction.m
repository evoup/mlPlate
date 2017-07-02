function Feature5Extraction()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%读取图片的编号，类别信息和文件名
indexFileName = input3;%获得文件名
fid=fopen('feature5.txt','w+');%打开feature5.txt，用以储存特征5的数据
for k=1:1000 %共1000个图片
A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));%读入图片
t=graythresh(A); %取阈值
B=im2bw(A,t);%二值化，B为二值化后的图像矩阵，每个元素的值为0或1
[a,b]=size(B);
C=zeros(1,a+b);%定义特征向量


M=zeros(12,6); %定义特征向量
for i=1:a
    for j=1:b
        ceil(j)
        if(B(i,j)==1)
            M(ceil(i/4),ceil(j/4))=M(ceil(i/4),ceil(j/4))+1
        end
    end
end


C=reshape(M,1,72)
[a,b]=size(M)
fprintf(fid,'%d',k);
fprintf(fid,'%s','       ');
for i=1:a+b-1
  fprintf(fid,'%d',C(1,i));%将特征向量写入文本
  fprintf(fid,'%s',',');%用逗号隔开
end
if k~=1000
fprintf(fid,'%d\n',C(1,a+b));%不为最后一行，则每行末尾加回车
else
fprintf(fid,'%d',C(1,a+b)); %最后一行则不加
end

end
fclose(fid);%关闭文件
