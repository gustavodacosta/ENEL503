function [CV] = CharacteristicValues(Im)
% CharacteristicValues - Calculate Characteristic Values from Images
%
% Syntax: 
%   [CV] = CharacteristicValues(Im)
%
% Input:
%   Im - A cell array containing images
%
% Output:
%   CV - Characteristic Values vector for each image in Im
%
% Description:
%   This function takes a cell array of images and calculates
%   Characteristic Values for each image.
%
% Parameters:
%   X, Y - Dimensions for the temporary image matrix
%   CV - Characteristic Values vector for each image
%   Imk - Temporary image matrix for each iteration
%   Sum - Accumulator for pixel values in the image
%
% Example:
%   img1 = imread('image1.jpg');
%   img2 = imread('image2.jpg');
%   images = {struct('image', img1), struct('image', img2)};
%   charValues = CharacteristicValues(images);
%
% Author: Gustavo Da Costa Gomez

% Set temporary image dimensions
X = 500;
Y = X;

% Initialize the Characteristic Values vector
CV = zeros(1, length(Im));

% Iterate through each image in the cell array
for k = 1:length(Im)
    % Extract the image matrix
    Imk = Im(1, k).image;
    
    % Initialize the pixel sum accumulator
    Sum = 0;
    
    % Iterate through each pixel in the image
    for i = 1:X
        for j = 1:Y
            % Accumulate pixel values
            Sum = Sum + double(Imk(i, j));
        end
        % Calculate Characteristic Value for the current row
        CV(k) = Sum / (255 * X * Y);
    end
end

end