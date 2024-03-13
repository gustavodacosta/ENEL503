function removedShadowImage = removeShadow(image)
% removeShadowImage = removeShadow(image)
% This function removes the shadow from the input RGB image.

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

% Convert the modified image to grayscale
removedShadowGrayImage = rgb2gray(removedShadowImage);

% Display the result
figure;
subplot(2, 2, 1), imshow(image), title('Original Image');
subplot(2, 2, 2), imshow(shadowMask, []), title('Shadow Mask');
subplot(2, 2, 3), imshow(removedShadowImage), title('Image with Removed Shadow');
subplot(2, 2, 4), imshow(removedShadowGrayImage), title('Greyscale Image with Removed Shadow');
sgtitle("Question 4");

end
