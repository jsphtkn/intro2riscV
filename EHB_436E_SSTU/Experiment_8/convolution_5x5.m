clear all;
clc;

% 3x3 Image Convolution
image = [128 128 128 128 128; 255 255 128 255 255 ;255 255 128 255 255 ; 255 255 128 255 255 ; 255 255 128 255 255 ];

kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1]; 

result = conv2(image,kernel, 'valid')


result = uint8(result);

subplot(1,2,1);
imagesc(image);
colormap gray

subplot(1,2,2);
imagesc(result);
colormap gray


