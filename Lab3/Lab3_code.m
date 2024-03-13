%% ENEL 503 Lab 3
% Gustavo Da Costa Gomez, 30085980

% Clear workspace, close figures, and clear command window
clear
close all
clc

%% Question 1

% Q1 a)
% Correlation
P = [0 0 0; 0 5 8; 0 5 2];
M = [-2 -1 -0; -1 1 1; 0 1 1];
Mmir = [1 1 0; 1 1 -1 ; 0 -1 -2];
Corr = conv2(Mmir, P);

% Display and plot results
figure(1)
subplot(1,3,1), imshow(P), title('Original Image (P)');
subplot(1,3,2), imshow(Mmir), title('Mask (Mmir)');
subplot(1,3,3), imshow(Corr), title('Correlation M(.)P');

% Convolution
Conv = conv2(M, P);

% Display and plot results
figure(2)
subplot(1,3,1), imshow(P), title('Original Image (P)');
subplot(1,3,2), imshow(M), title('Mask (M)');
subplot(1,3,3), imshow(Conv), title('Convolution M*P');

% Lenna Example
lenna = imread("Lenna.jpg");
Mask = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9;];
Conv = imfilter(lenna, Mask, 'full', 'conv');
Corl = imfilter(lenna, Mask, 'full', 'corr');

% Display and plot results
figure(3)
subplot(1,3,1), imshow(lenna), title('Original Image');
subplot(1,3,2), imshow(Conv), title('Convolution');
subplot(1,3,3), imshow(Corl), title('Correlation');

% Q1 b)
% Dilation
A = [0 0 0 0 0; 0 1 1 0 0; 0 1 1 0 0; ...
    0 0 1 0 0; 0 0 0 0 0];
M = strel('square', 2);
Mpad = padarray([1 1; 1 1], [2 2], 0, 'both');
D1 = imdilate(A, Mpad);
D2 = imdilate(Mpad, A);

% Display and plot results
figure(4)
subplot(1,4,1), imshow(A), title('Image A');
subplot(1,4,2), imshow(Mpad), title('Mask M');
subplot(1,4,3), imshow(D1), title('M (+) A');
subplot(1,4,4), imshow(D2), title('A (+) M');

% Erosion
E1 = imerode(A, Mpad);
E2 = imerode(Mpad, A);

% Display and plot results
figure(5)
subplot(1,4,1), imshow(A), title('Image A');
subplot(1,4,2), imshow(Mpad), title('Mask M');
subplot(1,4,3), imshow(E1), title('M (-) A');
subplot(1,4,4), imshow(E2), title('A (-) M');

%% Question 2

% Read Moon.tif image
Im = imread("Moon.tif");

% Add Gaussian noise to the image
Inoi = imnoise(Im,'gaussian',0.01);

% Apply a 5x5 average filter to blur the image
Fblur = fspecial('average', 5);
Iblur = imfilter(Inoi, Fblur);

% Sharpen the image
SharpIm = (Im - Iblur) + Im;

% Display and plot results
figure(6)
subplot(1,2,1), imshow(Im), title('Original Image');
subplot(1,2,2), imshow(SharpIm), title('Sharpened Image');

%% Question 3

% Read Statue.png image
Im = imread("Statue.png");

% Create a disk-shaped structuring element with radius 3
Mse = strel('disk', 3);

% Algorithm 1
ImTh = imtophat(Im, Mse);
ImBh = imbothat(Im, Mse);
ImEnhance = Im + ImTh - ImBh;

% Display and plot results
figure(7)
subplot(1,4,1), imshow(Im), title('Im');
subplot(1,4,2), imshow(ImTh), title('ImTh');
subplot(1,4,3), imshow(ImBh), title('ImBh');
subplot(1,4,4), imshow(ImEnhance), title('ImEnhance');
sgtitle('Algorithm 1');

% Algorithm 2
term_1 = Im - (imopen(Im, Mse));
term_2 = (imclose(Im, Mse)) - Im;
ImEnhance = Im + term_1 - term_2;

% Display and plot results
figure(8)
subplot(1,4,1), imshow(Im), title('Im');
subplot(1,4,2), imshow(term_1), title('X - [M(.)X]');
subplot(1,4,3), imshow(term_2), title('[M()X]-X');
subplot(1,4,4), imshow(ImEnhance), title('ImEnhance');
sgtitle('Algorithm 2');

%% Question 4

% Read LennaGNoise.jpg image
Im = imread("LennaGNoise.jpg");

% Apply Gaussian filter with standard deviation 0.8
Im1 = imgaussfilt(Im, 0.8);

% Apply 3x3 arithmetic mean filter
Filter1 = fspecial('average', [3 3]);
Im2 = imfilter(Im, Filter1);

% Display and plot results
figure(9)
subplot(1,3,1), imshow(Im), title('Original Image');
subplot(1,3,2), imshow(Im1), title('Gaussian Filter');
subplot(1,3,3), imshow(Im2), title('Arithmetic Mean Filter');

%% Question 5

% Initialize a 16x16 barcode matrix
Barcode = zeros(16, 16);

% Arbitrary string for the barcode
Str = 'Hello World! This is my barcode.';
StrB = reshape(dec2bin(Str, 8).' - '0', 1, []);

% Populate the barcode matrix with the binary representation of the string
for i = 1:length(Barcode)
    for j = 1:length(Barcode)
        index = ((j-1)*16) + i;
        Barcode(i, j) = StrB(index);
    end
end

% Display and plot the generated barcode
figure(10),
imshow(Barcode, 'InitialMagnification', 'fit'), title("Barcode")

% Convert barcode segments to integers and then to characters
BinarySegments = reshape(Barcode, 8, []).';
IntValues = bin2dec(char(BinarySegments + '0'));
RecognizedStr = char(IntValues.');

% Display the recognized barcode information
disp('Recognized Barcode Information:');
disp(RecognizedStr);
