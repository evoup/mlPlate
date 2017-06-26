% X是特征向量1，y是类别编号
X=[1,2,3]
y=[4,5,6]
X=X'
y=y'
%plot(X,y)
C = 1
sigma = 0.1
%M2 = dlmread("feature1.txt")
[input] = textread('feature1.txt','%s');


fprintf('---------解压特征-------------\n')
[input] = textread( 'feature1.txt', '%s' , 'delimiter' , '\n' , 'headerlines' , 1)
[num_features,]=size(input)
for i=1:num_features
    fprintf('%d\n' , i)
    % m = cell2mat(input(i))
    % str = mat2str(m)
    fprintf('%s\n', input{i})
end



model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
