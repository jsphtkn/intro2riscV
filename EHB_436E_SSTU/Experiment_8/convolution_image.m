
% 3x3 Laplacian kernel
kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1]; 

% Grayscale Image
image = imread('cameraman.tif');
image2 = conv2(image,kernel,'same');
image2 = uint8(image2);

figure
subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(image2);  % net effect is detection of edges of the image



% 3x3 Laplacian kernel
kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1]; 

% RGB Image
image3 = imread('lenna.tif');
image4 = convn(image3,kernel,'same');
image4 = uint8(image4);

figure
subplot(1,2,1);
imshow(image3);
subplot(1,2,2);
imshow(image4);  % net effect is detection of edges of the image


