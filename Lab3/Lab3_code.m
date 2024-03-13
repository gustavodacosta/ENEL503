%% ENEL 503 Lab 3
% Gustavo Da Costa Gomez, 30085980

clear
close all
%% Question 1

% % Q1 a)
% % Correlation
% P = [0 0 0; 0 5 8; 0 5 2];
% M = [-2 -1 -0; -1 1 1; 0 1 1];
% Mmir = [1 1 0; 1 1 -1 ; 0 -1 -2];
% Corr = conv2(Mmir, P);
% disp(Corr);
% 
% figure(1)
% subplot(1,3,1), imshow(P), title('Original Image (P)');
% subplot(1,3,2), imshow(Mmir), title('Mask (Mmir)');
% subplot(1,3,3), imshow(Corr), title('Correlation M(.)P');
% 
% % Correlation
% Conv = conv2(M, P);
% disp(Conv)
% 
% figure(2)
% subplot(1,3,1), imshow(P), title('Original Image (P)');
% subplot(1,3,2), imshow(M), title('Mask (M)');
% subplot(1,3,3), imshow(Conv), title('Convolution M*P');
% 
% % Lenna Example
% lenna = imread("Lenna.jpg");
% Mask = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9;];
% Conv = imfilter(lenna, Mask, 'full', 'conv');
% Corl = imfilter(lenna, Mask, 'full', 'corr');
% 
% figure(3)
% subplot(1,3,1), imshow(lenna), title('Original Image');
% subplot(1,3,2), imshow(Conv), title('Convulation');
% subplot(1,3,3), imshow(Corl), title('Correlation');
% 
% 
% % Q1 b)
% % Dilation
% A = [0 0 0 0 0; 0 1 1 0 0; 0 1 1 0 0; ...
%     0 0 1 0 0; 0 0 0 0 0];
% M = strel('square', 2);
% Mpad = padarray([1 1; 1 1], [2 2], 0, 'both');
% D1 = imdilate(A, Mpad);
% D2 = imdilate(Mpad, A);
% 
% figure(4)
% subplot(1,4,1), imshow(A), title('Image A');
% subplot(1,4,2), imshow(Mpad), title('Mask M');
% subplot(1,4,3), imshow(D1), title('M (+) A');
% subplot(1,4,4), imshow(D2), title('A (+) M');
% 
% % Erosion
% E1 = imerode(A, Mpad);
% E2 = imerode(Mpad, A);
% 
% figure(5)
% subplot(1,4,1), imshow(A), title('Image A');
% subplot(1,4,2), imshow(Mpad), title('Mask M');
% subplot(1,4,3), imshow(E1), title('M (-) A');
% subplot(1,4,4), imshow(E2), title('A (-) M');

%% Question 2
% 
% Im = imread("Moon.tif");
% 
% Inoi = imnoise(Im,'gaussian',0.01);
% Fblur = fspecial ('average', 5);
% Iblur = imfilter(Inoi,Fblur);
% 
% SharpIm = (Im-Iblur) + Im;
% figure(6)
% subplot(1,2,1), imshow(Im), title('Original Image');
% subplot(1,2,2), imshow(SharpIm), title('Sharpened Image');
% 
%% Question 3
% 
% Im = imread("Statue.png");
% Mse = strel('disk', 3);
% 
% % Algorithm 1
% ImTh = imtophat(Im,Mse);
% ImBh = imbothat(Im,Mse);
% ImEnhance = Im + ImTh - ImBh;
% 
% figure(7)
% subplot(1,4,1), imshow(Im), title('Im');
% subplot(1,4,2), imshow(ImTh), title('ImTh');
% subplot(1,4,3), imshow(ImBh), title('ImBh');
% subplot(1,4,4), imshow(ImEnhance), title('ImEnhance');
% sgtitle('Algorithm 1');
% 
% % Algorithm 2
% term_1 = Im - (imopen(Im, Mse));
% term_2 = (imclose(Im, Mse)) - Im;
% ImEnhance = Im + term_1 - term_2;
% 
% figure(8)
% subplot(1,4,1), imshow(Im), title('Im');
% subplot(1,4,2), imshow(term_1), title('X - [M(.)X]');
% subplot(1,4,3), imshow(term_2), title('[M()X]-X');
% subplot(1,4,4), imshow(ImEnhance), title('ImEnhance');
% sgtitle('Algorithm 2');

% %% Question 4
% 
% Im = imread("LennaGNoise.jpg");
% 
% % Gaussian Filter
% Im1 = imgaussfilt(Im, 0.8);
% 
% % Arithmetic Mean Filter
% Filter1 = fspecial('average', [3 3]);
% Im2 = imfilter(Im, Filter1);
% 
% % Show Filter Results
% figure(9)
% subplot(1,3,1), imshow(Im), title('Original Image');
% subplot(1,3,2), imshow(Im1), title('Gaussian Filter');
% subplot(1,3,3), imshow(Im2), title('Arithmetic Mean Filter');

%% Question 5

Im_Barcode = zeros(16,16);

Str = 'Hello World! This is my barcode.';
StrB = reshape(dec2bin(Str, 8).'-'0',1,[]);

for i = 1:length(Im_Barcode)
    for j = 1:length(Im_Barcode)
        index = ((i-1)*16)+j;
        Im_Barcode(i,j) = StrB(index);
    end
end

Im_Resize = zeros(256,256);

figure(10), imshow(Im_Barcode);

