Im_Car = imread('Car1.jpg');
Im_Car_new = removeShadow(Im_Car);

function removedShadowImage = removeShadow(image)
% Convert the image to grayscale
grayImage = rgb2gray(image);

% Define the sample box sizes for shadow and background
shadowBoxSize = 4;
backgroundBoxSize = 10;

% Estimate the average pixel value of the shadow
shadowAvgValue = estimateAverageValue(grayImage, shadowBoxSize);

% Estimate the average pixel value of the background
backgroundAvgValue = mean(estimateAverageValue(grayImage, backgroundBoxSize), "All");

% Identify the shadow region (assumption: shadow is darker than the background)
shadowMask = 40 > shadowAvgValue;

% Create a copy of the original image
removedShadowImage = image;

% Replace shadow pixel values with background pixel values
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        if shadowMask(i, j)
            % Replace RGB values at shadow pixels with background RGB values
            removedShadowImage(i, j, 1) = backgroundAvgValue;
            removedShadowImage(i, j, 2) = backgroundAvgValue;
            removedShadowImage(i, j, 3) = backgroundAvgValue;
        end
    end
end

removedShadowGrayImage = rgb2gray(removedShadowImage);

% Display the result
figure;
subplot(2, 2, 1), imshow(image), title('Original Image');
subplot(2, 2, 2), imshow(shadowMask, []), title('Shadow Mask');
subplot(2, 2, 3), imshow(removedShadowImage), title('Image with Removed Shadow');
subplot(2, 2, 4), imshow(removedShadowGrayImage); title(' Greyscale Image with Removed Shadow');

end


function avgValue = estimateAverageValue(image, boxSize)
    % Estimate the average pixel value within a sample box
    [rows, columns] = size(image);

    avgValue = zeros(rows, columns);

    for i = 1:rows/boxSize
        for j = 1:columns/boxSize
            index_y = (boxSize*i)-(boxSize-1);
            index_x = (boxSize*j)-(boxSize-1);
            box = imcrop(image, [index_x index_y ...
                boxSize-1 boxSize-1]);
            avgValue(index_y:index_y+boxSize-1, index_x:index_x+boxSize-1) = mean(box, 'all');
        end
    end

end


