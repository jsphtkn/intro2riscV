% Step 1: Read data from the text files
file1 = 'output_blue.txt'; % Blue channel file
file2 = 'output_green.txt'; % Green channel file
file3 = 'output_red.txt'; % Red channel file

data1 = dlmread(file1); % Read blue channel
data2 = dlmread(file2); % Read green channel
data3 = dlmread(file3); % Read red channel

% Step 2: Reshape the red channel data into a 640x480 matrix
rows = 480; % Number of rows in the image
cols = 640; % Number of columns in the image

if length(data3) ~= rows * cols
    error('The red channel data size does not match the required matrix size (640x480).');
end

matrix = reshape(data3, [cols, rows])'; % Reshape and transpose to get 480x640

% Step 3: Write the reshaped red channel matrix to a new text file
outputFile = 'output_red.txt'; % Specify the output file name
dlmwrite(outputFile, matrix, 'delimiter', '\t', 'precision', '%d');

disp('Red channel matrix has been written to the output file successfully.');
