function [Sim] = SimilarityDetermination(Im)
% SimilarityDetermination - Calculate Image Similarity Matrix
%
% Syntax: 
%   [Sim] = SimilarityDetermination(Im)
%
% Input:
%   Im - A cell array containing images
%
% Output:
%   Sim - Image Similarity Matrix
%
% Description:
%   This function takes a cell array of images and calculates the
%   similarity matrix between each pair of images.
%
% Parameters:
%   X, Y - Dimensions for the temporary image matrix
%   Sim - Image Similarity Matrix
%   Imk - Temporary image matrix for each iteration
%   Sum - Accumulator for pixel differences between images
%
% Example:
%   img1 = imread('image1.jpg');
%   img2 = imread('image2.jpg');
%   images = {struct('image', img1), struct('image', img2)};
%   similarityMatrix = SimilarityDetermination(images);
%
% Author: Gustavo Da Costa Gomez

% Set temporary image dimensions
X = 500;
Y = X;

% Initialize the Image Similarity Matrix
Sim = zeros(length(Im), length(Im));

% Initialize the temporary image matrix
Imk = zeros(X, Y);

% Iterate through each pair of images
for k = 1:length(Im)
    for l = 1:length(Im)
        % Extract the image matrices
        Imk = Im(1, k).image;
        
        % Initialize the pixel difference accumulator
        Sum = 0;
        
        % Iterate through each pixel in the images
        for i = 1:X
            for j = 1:Y
                % Accumulate absolute pixel differences
                Sum = Sum + abs(double(Im(1, l).image(i, j)) - double(Imk(i, j)));
            end
            % Calculate similarity score for the current row
            Sim(k, l) = 1 - Sum / (255 * X * Y);
        end
    end
end

end