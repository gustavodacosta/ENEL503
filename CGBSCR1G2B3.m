function [Im] = CGBSCR1G2B3(image)
% CGBSCR1G2B3 - Color and Image Processing Function
%
% Syntax: 
%   [Im] = CGBSCR1G2B3(image)
%
% Input:
%   image - The input image file path or matrix
%
% Output:
%   Im - A cell array containing various processed versions of the input image
%
% Description:
%   This function takes an input image and performs several color and 
%   image processing operations to generate different representations 
%   of the original image.
%
% Processing Steps:
%   1. Read the input image.
%   2. Convert the image to grayscale.
%   3. Binarize the grayscale image.
%   4. Apply grayscale slicing with 20 levels.
%   5. Extract the red channel of the original image.
%   6. Extract the green channel of the original image.
%   7. Extract the blue channel of the original image.
%
% Example:
%   img = 'path/to/your/image.jpg';
%   processedImages = CGBSCR1G2B3(img);
%
% Author: Your Name
% Date:   Current Date

% Step 1: Read the input image
Im = repmat({}, 7);
Im(1,1).image = imread(image);

% Step 2: Convert the image to grayscale
Im(1,2).image = rgb2gray(Im(1,1).image);

% Step 3: Binarize the grayscale image
Im(1,3).image = imbinarize(Im(1,2).image);

% Step 4: Apply grayscale slicing with 20 levels
Im(1,4).image = grayslice(Im(1,2).image, 20);

% Step 5: Extract the red channel of the original image
Im(1,5).image = Im(1,1).image(:,:,1);

% Step 6: Extract the green channel of the original image
Im(1,6).image = Im(1,1).image(:,:,2);

% Step 7: Extract the blue channel of the original image
Im(1,7).image = Im(1,1).image(:,:,3);

end