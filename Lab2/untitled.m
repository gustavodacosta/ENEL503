image = imread('Car1.jpg');
% Im_Car_new = removeShadow(Im_Car);

% Convert the image to grayscale
grayImage = rgb2gray(image);

% Define the sample box sizes for shadow and background
shadowBoxSize = 4;
backgroundBoxSize = 10;

% Estimate the average pixel value of the shadow
shadowAvgValue = estimateAverageValue(grayImage, shadowBoxSize);

% Estimate the average pixel value of the background
backgroundAvgValue = estimateAverageValue(grayImage, backgroundBoxSize);

% Identify the shadow region (assumption: shadow is darker than the background)
shadowMask = grayImage < shadowAvgValue;

% Create a copy of the original image
removedShadowImage = image;

% Replace shadow pixel values with background pixel values
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        if shadowMask(i, j)
            % Replace RGB values at shadow pixels with background RGB values
            removedShadowImage(i, j, 1) = backgroundAvgValue(i, j);
            removedShadowImage(i, j, 2) = backgroundAvgValue(i, j);
            removedShadowImage(i, j, 3) = backgroundAvgValue(i, j);
        end
    end
end

% Display the result
figure;
subplot(1, 2, 1), imshow(image), title('Original Image');
subplot(1, 2, 2), imshow(removedShadowImage), title('Image with Removed Shadow');

function avgValues = estimateAverageValue(image, boxSize)
    % Estimate the average pixel values within a sample box
    avgValues = filter2(ones(boxSize), double(image), 'same') / (boxSize^2);
end