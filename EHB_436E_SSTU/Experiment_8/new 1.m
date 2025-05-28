% Define the file names
r_file = 'output_red.txt';
g_file = 'output_green.txt';
b_file = 'output_blue.txt';

% Define the image size
width = 640;
height = 480;

% Read the R, G, B values from the text files
R = dlmread(r_file); % Reads all values into a vector
G = dlmread(g_file);
B = dlmread(b_file);

% Ensure the data matches the required dimensions
if length(R) ~= width * height || length(G) ~= width * height || length(B) ~= width * height
    error('The number of values in the files does not match the required 640x480 resolution.');
end

% Reshape the vectors into 2D matrices (height x width)
R_ = reshape(R, [width, height])'; % Transpose to get the correct orientation
G = reshape(G, [width, height])';
B = reshape(B, [width, height])';

% Scale 4-bit values (0-15) to 8-bit values (0-255)
R_ = uint8(R_ * (255 / 15));
G = uint8(G * (255 / 15));
B = uint8(B * (255 / 15));

% Combine the R, G, B channels into an RGB image
RGB_image = cat(3, R_, G, B);

% Display the image
imshow(RGB_image);
title('RGB Image');

% Save the image to a file
imwrite(RGB_image, 'output_image.png');
disp('Image saved as output_image.png');
