clear
close all

Im_Car = rgb2gray(imread('Car1.jpg'));
[rows, columns] = size(Im_Car);
col1 = 1;
col2 = floor(columns/2);
col3 = col2 + 1;
row1 = 1;
row2 = floor(rows/2); 
row3 = row2 + 1;
Im_Car_crop = imcrop(Im_Car, [160 1 4-1 4-1]);

figure(1)
imshow(Im_Car)

figure(2)
imshow(Im_Car_crop)

[Hx, Hy] = SpatialHistogram(Im_Car_crop);

figure(1)
subplot(2,2,2), plot(1:length(Hx), Hx), title('Hx Histogram');
subplot(2,2,3), plot(flip(Hy), 1:length(Hy)), title('Hy Histogram');
subplot(2,2,4), imshow(Im_SH_test), title('SH\_test.tif');