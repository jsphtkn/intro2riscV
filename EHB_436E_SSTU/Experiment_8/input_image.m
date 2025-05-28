clc;
clear all;

% read image and resize it to 640x480 with zero padding
img  = imread('lenna.tif');
img  = imresize(img, [480 480]);
img2 = uint8(zeros(482,642,3));
img2(2:481,81:560,1:3) = img;
imshow(img2);

% Convert the image into 12-bit RGB Colormap (normalization)
img12bit = img2/16;
img12arr = uint8(zeros(309444,3));

b = img12bit(:,:,3);

% change the radix from decimal to hex
for k=1:1:3
    for i=1:1:482
        for j=1:1:642
            img12arr(j+(i-1)*642,k) = img12bit(i,j,k); %% array
        end
    end
end
Red   = dec2hex(img12arr(:,1));
Red   = Red(:,2);
Blue  = dec2hex(img12arr(:,2));
Blue  = Blue(:,2);
Green = dec2hex(img12arr(:,3));
%Green  = Green(:,2);

% output files
fileID1 = fopen('red_input.txt','w');
fprintf( fileID1,'MEMORY_INITIALIZATION_RADIX=16;\nMEMORY_INITIALIZATION_VECTOR=' );
for i=1:3:309444
    fprintf(fileID1,'%s', Red(i)    );
    fprintf(fileID1,'%s', Red(i+1)  );
    fprintf(fileID1,'%s', Red(i+2)  );
    fprintf(fileID1,',\r\n');
end
fprintf( fileID1,';' );


fileID2 = fopen('green_input.txt','w');
fprintf( fileID2,'MEMORY_INITIALIZATION_RADIX=16;\nMEMORY_INITIALIZATION_VECTOR=' );
for i=1:3:309444
    fprintf(fileID2,'%s', Green(i)  );
    fprintf(fileID2,'%s', Green(i+1));
    fprintf(fileID2,'%s', Green(i+2));
    fprintf(fileID2,',\r\n');
end
fprintf( fileID2,';' );

fileID3 = fopen('blue_input.txt','w');
fprintf( fileID3,'MEMORY_INITIALIZATION_RADIX=16;\nMEMORY_INITIALIZATION_VECTOR=' );
for i=1:3:309444
    fprintf(fileID3,'%s', Blue(i)   );
    fprintf(fileID3,'%s', Blue(i+1) );
    fprintf(fileID3,'%s', Blue(i+2) );
    fprintf(fileID3,',\r\n');
end
fprintf( fileID3,';' );

fclose(fileID1);
fclose(fileID2);
fclose(fileID3);


