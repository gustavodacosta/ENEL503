%% ENEL 503 Lab 1
% Gustavo Da Costa Gomez, 30085980

%% Question 1

% Im = CGBSCR1G2B3('Mandrill.png');
% 
% ImC = Im(1,1).image;
% ImG = rgb2gray(ImC);
% 
% ImR1 = Im(1,5).image;
% ImG2 = Im(1,6).image;
% ImB3 = Im(1,7).image;
% 
% ImGs = 0.2989*ImR1 + 0.5870*ImG2 + 0.1140*ImB3;
% 
% Im_compare = repmat({}, 2);
% Im_compare(1,1).image = ImG;
% Im_compare(1,2).image = ImGs;
% 
% Sim = SimilarityDetermination(Im_compare);
% disp(Sim);
% 
% figure
% subplot(1,2,1), imshow(ImG), title('ImG');
% subplot(1,2,2), imshow(ImGs), title('ImGs');
% sgtitle('Question 1 Images');

%% Question 2

% Q2 a)
% Im = repmat({}, 2);
Im21 = imread('Im21.jpg');
Im22 = imread('Im22.jpg');

Im_morph = repmat({}, 5);
n = 4;

% for k = 1:5
% %     arg1 = imadd(Im(1,2).image, (1-(k/n)));
%     arg1 = Im(1,1).image - Im(1,2).image;
%     arg2 = arg1*(1-((k-1)/n));
%     Im_morph(1,k).image = arg2 + Im(1,2).image;
% end

figure
% subplot(1,5,1), imshow(Im(1,1).image), title('Fig1');
% subplot(1,5,2), imshow(Im_morph(1,1).image), title('Fig2');
% subplot(1,5,3), imshow(Im_morph(1,2).image), title('Fig12');
% subplot(1,5,4), imshow(Im_morph(1,3).image), title('Rand1');
% subplot(1,5,5), imshow(Im_morph(1,4).image), title('Rand2');
imshow(imadd(imsubtract(Im21,Im22),Im22));

