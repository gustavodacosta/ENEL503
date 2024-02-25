%% ENEL 503 Lab 2
% Gustavo Da Costa Gomez, 30085980

clc
clear
close all

%% Question 1

% Load an image using a custom function CGBSCR1G2B3 and convert it to grayscale
Im = CGBSCR1G2B3('Mandrill.png');
ImC = Im(1,1).image;
ImG = rgb2gray(ImC);

% Extract color channels (Red, Green, Blue) from the original image
ImR1 = Im(1,5).image;
ImG2 = Im(1,6).image;
ImB3 = Im(1,7).image;

% Create grayscale image using weighted combination of color channels
ImGs = 0.2989 * ImR1 + 0.5870 * ImG2 + 0.1140 * ImB3;

% Display original grayscale image and the computed grayscale image
Im_compare = repmat({}, 2);
Im_compare(1,1).image = ImG;
Im_compare(1,2).image = ImGs;

Sim = SimilarityDetermination(Im_compare);
disp("Question 1 Output: " + newline);
disp(Sim);

figure(1)
subplot(1,2,1), imshow(ImG), title('ImG');
subplot(1,2,2), imshow(ImGs), title('ImGs');
sgtitle('Question 1 Images');

%% Question 2

% Q2 a) - Morphing between two images
Im21 = imread('Im21.jpg');
Im22 = imread('Im22.jpg');

Im_morph = repmat({}, 5);
n = 5;

figure(2)
for k = 1:5
    % Linear interpolation between two images
    Im = double(Im22) + (1-k/n)*(double(Im21) - double(Im22));
    Im = min(max(Im, 0), 255);
    Im_morph(1,k).image = uint8(Im);

    % Display morphed images
    subplot(1,n,k), imshow(Im_morph(1,k).image), title('Image');
    sgtitle("Question 2 a)");
end

% Q2 b) - Morphing between two color images
Im21 = CGBSCR1G2B3('Im21.jpg');
Im22 = CGBSCR1G2B3('Im22.jpg');

% Extract color channels from each image
Im21R = Im21(1, 5).image;
Im21G = Im21(1, 6).image;
Im21B = Im21(1, 7).image;

Im22R = Im22(1, 5).image;
Im22G = Im22(1, 6).image;
Im22B = Im22(1, 7).image;

ImR = zeros(240, 160);
ImG = zeros(240, 160);
ImB = zeros(240, 160);

n = 5;

figure(3)
for k = 1:n
    for i = 1:240
        for j = 1:160
            % Linear interpolation for each pixel in color channels
            ImR(i, j) = double(Im22R(i, j)) + (1-k/n)*(double(Im21R(i, j)) - double(Im22R(i, j)));
            ImR(i, j) = min(max(ImR(i, j), 0), 255);

            ImG(i, j) = double(Im22G(i, j)) + (1-k/n)*(double(Im21G(i, j)) - double(Im22G(i, j)));
            ImG(i, j) = min(max(ImG(i, j), 0), 255);

            ImB(i, j) = double(Im22B(i, j)) + (1-k/n)*(double(Im21B(i, j)) - double(Im22B(i, j)));
            ImB(i, j) = min(max(ImB(i, j), 0), 255);
        end
    end

    % Combine color channels to create the morphed image
    Im_morph = cat(3, ImR, ImG, ImB);

    % Display morphed color images
    subplot(1, n, k), imshow(uint8(Im_morph)), title(['Image ' num2str(k)]);
    sgtitle("Question 2 b)");
end

%% Question 3

% Load an image for spatial histogram analysis
Im_SH_test = imread('SH_Test.tif');

% Calculate spatial histograms along rows (Hx) and columns (Hy)
[Hx, Hy] = SpatialHistogram(Im_SH_test);

% Display spatial histograms and the original image
figure(4)
subplot(2,2,2), plot(1:length(Hx), Hx), title('Hx Histogram');
subplot(2,2,3), plot(Hy, 1:length(Hy)), title('Hy Histogram');
set(gca,'ydir','reverse'); % Invert y-axis to match the image orientation
subplot(2,2,4), imshow(Im_SH_test), title('SH\_test.tif');
sgtitle('Question 3');

% Initialize variables to store coordinates
[x1, x2, x3, x4, y1, y2, y3, y4] = deal(0);

% Identify peaks in Hx and Hy histograms
Hx_ones = Hx > 1;
Hy_ones = Hy > 1;

% Extract coordinates for images peaks in Hx histogram
for i = 2:length(Hx_ones)-1
    if Hx_ones(i) == Hx_ones(i-1)
        if x1 == 0
            x1 = i-1;
        end
    end
    if Hx_ones(i) ~= Hx_ones(i-1)
        if x2 == 0
            x2 = i-1;
        elseif x2 > 0
            if x3 == 0
                x3 = i-1;
            else
                x4 = i-1;
            end
        end
    end
end

% Extract coordinates for images peaks in Hy histogram
for i = 2:length(Hy_ones)-1
    if Hy_ones(i) == Hy_ones(i-1)
        if y1 == 0
            y1 = i-1;
        end
    end
    if Hy_ones(i) ~= Hy_ones(i-1)
        if y2 == 0
            y2 = i-1;
        elseif y2 > 0
            if y3 == 0
                y3 = i-1;
            else
                y4 = i-1;
            end
        end        
    end
end

% Display the extracted coordinates
disp(newline)
disp("The Question 3 coordinates are O1((" + x1 ...
    + "," + y1 ...
    + "),(" + x2 ...
    + "," + y2 ...
    + ")) and O2((" + x3 ...
    + "," + y3 ...
    + "),(" + x4 ...
    + "," + y4 + ")).")

%% Question 4

% Load an image for shadow removal
Im_Car = imread('Car1.jpg');

% Call removeShadow function to remove shadows from the image
Im_Car_new = removeShadow(Im_Car);