%img = imread('Plate_Image/702172519671.jpg');
img = imread('Plate_Image/703211104156.jpg');
%img = imread('Plate_Image/703211332296.jpg');
imshow(img);

% c1左上 c2右上 c3右下 c4左下
%I2 = imcrop(img,[336 323 682-336 412-323]);
I2 = imcrop(img,[415 366 598-415 414-366]);
%I2 = imcrop(img,[426 349 588-426 398-349]);
figure, imshow(I2)
