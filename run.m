% X是特征向量1，y是类别编号
X=[1,2,3]
y=[4,5,6]
X=X'
y=y'
%plot(X,y)
C = 1
sigma = 0.1
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
