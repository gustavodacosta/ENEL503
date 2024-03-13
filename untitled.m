% a) Barcode Generation (20)

% Initialize the 16x16 2D Barcode as zeros
Im_Barcode = zeros(16, 16);

% Arbitrary string
Str = 'Hello World! This is my barcode.';

% Convert the string to binary representation
StrB = reshape(dec2bin(Str, 8).' - '0', 1, []);

% Populate the 2D Barcode with the binary representation of the string
for i = 1:length(Im_Barcode)
    for j = 1:length(Im_Barcode)
        index = ((j - 1) * 16) + i;
        Im_Barcode(i, j) = StrB(index);
    end
end

% Display the generated 2D Barcode
disp('Generated 2D Barcode:');
disp(Im_Barcode);

% Plot the generated barcode
figure;
imshow(Im_Barcode, 'InitialMagnification', 'fit');
title('Generated 2D Barcode');

%% b) Barcode Recognition (15)

% Step 4: Convert binary segments to integers (using bin2dec)
BinarySegments = reshape(Im_Barcode, 8, []).';
IntValues = bin2dec(char(BinarySegments + '0'));

% Step 5: Convert integers to characters
RecognizedStr = char(IntValues.');

% Display the recognized barcode information
disp('Recognized Barcode Information:');
disp(RecognizedStr);

% Plot the original and recognized barcodes
figure;
subplot(2, 1, 1);
imshow(Im_Barcode, 'InitialMagnification', 'fit');
title('Generated 2D Barcode');

subplot(2, 1, 2);
imshow(ones(1, length(RecognizedStr)), 'InitialMagnification', 'fit');
text(0.5, 0.5, RecognizedStr, 'FontSize', 12, 'HorizontalAlignment', 'center');
title('Recognized Barcode Information');