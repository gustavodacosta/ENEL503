% ENEL 503 Lab 1
% Gustavo Da Costa Gomez, 30085980

% Q1 a)
Fig1 = imread('Fig1.jpg');
Fig2 = imread('Fig2.jpg');
Fig12 = imread('Fig12.jpg');
Rand1 = imread('Rand1.jpg');
Rand2 = imread('Rand2.jpg');
Mandrill = imread('Mandrill.png');
subplot(2,3,1), imshow(Fig1), title('Fig1');
subplot(2,3,2), imshow(Fig2), title('Fig2');
subplot(2,3,3), imshow(Fig12), title('Fig12');
subplot(2,3,4), imshow(Rand1), title('Rand1');
subplot(2,3,5), imshow(Rand2), title('Rand2');
subplot(2,3,6), imshow(Mandrill), title('Mandrill');

% Q1 b)
Fig1_gray = rgb2gray(Fig1);
Fig2_gray = rgb2gray(Fig2);
Fig12_gray = rgb2gray(Fig12);
Rand1_gray = rgb2gray(Rand1);
Rand2_gray = rgb2gray(Rand2);
Mandrill_gray = rgb2gray(Mandrill);
figure
subplot(2,3,1), imshow(Fig1_gray), title('Fig1');
subplot(2,3,2), imshow(Fig2_gray), title('Fig2');
subplot(2,3,3), imshow(Fig12_gray), title('Fig12');
subplot(2,3,4), imshow(Rand1_gray), title('Rand1');
subplot(2,3,5), imshow(Rand2_gray), title('Rand2');
subplot(2,3,6), imshow(Mandrill_gray), title('Mandrill');



