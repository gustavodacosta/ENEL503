%% ENEL 503 Lab 1
% Gustavo Da Costa Gomez, 30085980

%% Question 1

% Q1 a)
Im = repmat({}, 6);
Im(1,1).image = imread('Fig1.jpg');
Im(1,2).image = imread('Fig2.jpg');
Im(1,3).image = imread('Fig12.jpg');
Im(1,4).image = imread('Rand1.jpg');
Im(1,5).image = imread('Rand2.jpg');
Im(1,6).image = imread('Mandrill.png');
figure
subplot(2,3,1), imshow(Im(1,1).image), title('Fig1');
subplot(2,3,2), imshow(Im(1,2).image), title('Fig2');
subplot(2,3,3), imshow(Im(1,3).image), title('Fig12');
subplot(2,3,4), imshow(Im(1,4).image), title('Rand1');
subplot(2,3,5), imshow(Im(1,5).image), title('Rand2');
subplot(2,3,6), imshow(Im(1,6).image), title('Mandrill');
sgtitle('Question 1 a)');


% Q1 b)
for i = 1:6
    Im(1,i).image = rgb2gray(Im(1,i).image);
end
figure
subplot(2,3,1), imshow(Im(1,1).image), title('Fig1');
subplot(2,3,2), imshow(Im(1,2).image), title('Fig2');
subplot(2,3,3), imshow(Im(1,3).image), title('Fig12');
subplot(2,3,4), imshow(Im(1,4).image), title('Rand1');
subplot(2,3,5), imshow(Im(1,5).image), title('Rand2');
subplot(2,3,6), imshow(Im(1,6).image), title('Mandrill');
sgtitle('Question 1 b)');

% Q1 c)
for i = 1:6
    Im(1,i).image = imresize(Im(1,i).image, [500, 500]);
end
figure
subplot(2,3,1), imshow(Im(1,1).image), title('Fig1');
subplot(2,3,2), imshow(Im(1,2).image), title('Fig2');
subplot(2,3,3), imshow(Im(1,3).image), title('Fig12');
subplot(2,3,4), imshow(Im(1,4).image), title('Rand1');
subplot(2,3,5), imshow(Im(1,5).image), title('Rand2');
subplot(2,3,6), imshow(Im(1,6).image), title('Mandrill');
sgtitle('Question 1 c)');

imwrite(Im(1,1).image, 'Fig1_gs.jpg');
imwrite(Im(1,2).image, 'Fig2_gs.jpg');
imwrite(Im(1,3).image, 'Fig12_gs.jpg');
imwrite(Im(1,4).image, 'Rand1_gs.jpg');
imwrite(Im(1,5).image, 'Rand2_gs.jpg');
imwrite(Im(1,6).image, 'Mandrill_gs.png');

%% Question 2

Im = CGBSCR1G2B3('Mandrill.png');

figure
subplot(2, 4, 1), imshow(Im(1,1).image);
subplot(2, 4, 2), imshow(Im(1,2).image);
subplot(2, 4, 3), imshow(Im(1,3).image);
subplot(2, 4, 4), imshow(Im(1,4).image, jet(20));
subplot(2, 4, 5), imshow(Im(1,5).image);
subplot(2, 4, 6), imshow(Im(1,6).image);
subplot(2, 4, 7), imshow(Im(1,7).image);
sgtitle('Question 2');

%% Question 3

Im = repmat({}, 6);
Im(1,1).image = imread('Fig1_gs.jpg');
Im(1,2).image = imread('Fig2_gs.jpg');
Im(1,3).image = imread('Fig12_gs.jpg');
Im(1,4).image = imread('Rand1_gs.jpg');
Im(1,5).image = imread('Rand2_gs.jpg');
Im(1,6).image = imread('Mandrill_gs.png');

CV = CharacteristicValues(Im);
disp(CV);

%% Question 4

Sim = SimilarityDetermination(Im);
disp(Sim);

%% Question 5

Sim = SimilarityDetermination(Im);
disp(Sim);







