clc;
clear all;

% Image 512x512
original = imread('lenna.tif');
original  = imresize(original, [480 480]);

% Zero Padding 642x482
img = int32(zeros(482,642,3));
img(2:481,81:560,1:3) = original;

% Normalizing /16 (4-bit)
img = img/16;

%%%%%%%%%%%%%%%%%%%%%%%
%%%%% CONVOLUTION %%%%%
%%%%%%%%%%%%%%%%%%%%%%%
img2  = int32(zeros(480,640,3));

temp1 = int32(zeros(8));
temp2 = int32(zeros(8));
temp3 = int32(zeros(8));
for k=1:1:3
    for i=1:1:480
        for j=1:1:640
            temp1 = -img(i,j,k) - img(i,j+1,k) - img(i,j+2,k);
            temp2 = -img(i+1,j,k) + 8*img(i+1,j+1,k) - img(i+1,j+2,k);
            temp3 = -img(i+2,j,k) - img(i+2,j+1,k) - img(i+2,j+2,k);
            if temp1 + temp2 + temp3 < 0
                img2(i,j,k) = 0;
            elseif temp1 + temp2 + temp3 > 15
                img2(i,j,k) = 15;
            else
                img2(i,j,k) = temp1 + temp2 + temp3;
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% workspaces and output files %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Red   = uint8(img2(:,:,1));
Green = uint8(img2(:,:,2));
Blue  = uint8(img2(:,:,3));

fileID1 = fopen('red_output.txt','w');
for i=1:1:480
    fprintf(fileID1,',\r\n');
    for j=1:1:640
        fprintf(fileID1,'%s', dec2hex(Red(i,j)) );
    end
end
fileID2 = fopen('green_output.txt','w');
for i=1:1:480
    fprintf(fileID2,',\r\n');
    for j=1:1:640
        fprintf(fileID2,'%s', dec2hex(Green(i,j)) );
    end
end
fileID3 = fopen('blue_output.txt','w');
for i=1:1:480
    fprintf(fileID3,',\r\n');
    for j=1:1:640
        fprintf(fileID3,'%s', dec2hex(Blue(i,j)) );
    end
end
fclose(fileID1);
fclose(fileID2);
fclose(fileID3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% IMAGE OUTPUT EFFECT %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img  = 16*img;
img2 = 16*img2;

figure
subplot(1,2,1);
imshow(uint8(img));
subplot(1,2,2);
imshow(uint8(img2));  % net effect is detection of edges of the image


% with Matlab Function
kernel = [ -1 -1 -1; -1 8 -1; -1 -1 -1]; 

img3 = imread('lenna.tif');
img4 = convn(img3,kernel,'same');
img4 = uint8(img4);

figure
subplot(1,2,1);
imshow(img3);
subplot(1,2,2);
imshow(img4);  % net effect is detection of edges of the image
