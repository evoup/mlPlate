#[heart_scale_label, heart_scale_inst] = libsvmread('./heart_scale');
heart_scale_inst = sparse([5,4,3,2,1])'
heart_scale_label =[1;2;3;4;5]
model = svmtrain(heart_scale_label, heart_scale_inst, '-c 1 -g 0.07');
[predict_label, accuracy, dec_values] = svmpredict(heart_scale_label, heart_scale_inst, model);