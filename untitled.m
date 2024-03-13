% Part a: Generate 2D Barcode

% Step 1: Initialize a 16 x 16 matrix as the barcode
Barcode = zeros(16, 16);

% Step 2: Convert the given string to binary representation
Str = 'Hello World! This is my barcode.';
StrB = reshape(dec2bin(Str, 8).'- '0', 1, []);

% Ensure StrB has the correct length
StrB = StrB(1:16*8); % Truncate to the required length

% Step 3: Write StrB into the 16 x (8 + 8) segments of Barcode
for i = 1:length(Barcode)
    for j = 1:length(Barcode)/2
        index = (i-1)*length(Barcode)/2 + j;
        Barcode(i, (j-1)*8+1:j*8) = StrB(index);
    end
end

% Display the generated Barcode
disp('Generated 2D Barcode:');
disp(Barcode);

% Display the generated Barcode
disp('Generated 2D Barcode:');
disp(Barcode);