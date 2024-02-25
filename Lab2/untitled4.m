clear
close all

Im_Car = rgb2gray(imread('Car1.jpg'));
figure(1), imshow(Im_Car);
[rows, columns] = size(Im_Car);

shadowbox = 4;
backgroundbox = 10;

shadow_averages = zeros(rows/shadowbox, columns/shadowbox);
background_averages = zeros(rows/backgroundbox, columns/backgroundbox);

image_shadow_removed = zeros(rows, columns);

% calculate shadow averages
for i = 1:rows/shadowbox
    for j = 1:columns/shadowbox
        index_y = (shadowbox*i)-3;
        index_x = (shadowbox*j)-3;
        box = imcrop(Im_Car, [index_x index_y ...
            shadowbox-1 shadowbox-1]);
        shadow_averages(i, j) = mean(box, "All");
    end
end

% calculate background averages
for i = 1:rows/backgroundbox
    for j = 1:columns/backgroundbox
        index_y = (backgroundbox*i)-9;
        index_x = (backgroundbox*j)-9;
        box = imcrop(Im_Car, [index_x index_y ...
            backgroundbox-1 backgroundbox-1]);
        background_averages(i, j) = mean(box, "All");
    end
end
