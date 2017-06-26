clear
% X是特征向量1，y是类别编号
%X=[1,2,3;4,5,6;7,8,9]
%y=[4,5,6]
%X=X'
%y=y'
%plot(X,y)
C = 1
sigma = 0.1
%M2 = dlmread("feature1.txt")
[input] = textread('feature1.txt','%s');


fprintf('---------解压特征-------------\n')
[input] = textread( 'feature1.txt', '%s' , 'delimiter' , '\n')
y=[]
X=[]
%[num_features,]=size(input)
num_features=numel(input)
for i=1:num_features
    fprintf('>>>>>>>>>>>>>>>>%d\n',i)
    fprintf('%d\n' , i)
    % m = cell2mat(input(i))
    % str = mat2str(m)
    % 单元格操作要用{}
    line = input{i}
    fprintf('%s\n', line)
    % w = strread(line,'%s')
    res = strsplit(line)
    pic_order = res{1} % 图片分类号
    comma_feature_str = res{2} % 特征字符串0,0,3,5,7... 
    feature = strsplit(comma_feature_str, ',')
    % [num_feature_elements, ] = size(feature') % 139维的第一类特征 
    num_feature_elements = numel(feature)
    X_element = []
    for j=1:num_feature_elements
        X_element = [X_element,str2num(feature{j})]
    end
    X = [X;[X_element]]
    y = [y;str2num(pic_order)]
    %X(i) = feature
    %y(i) = pic_order
end



model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
