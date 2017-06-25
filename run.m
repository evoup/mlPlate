 C = 0.1;
% X是特征向量1，y是类别编号
 model = svmTrain(X, y, C, @linearKernel);  
