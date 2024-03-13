function [Hy, Hx] = SpatialHistogram(Im)
% SpatialHistogram computes spatial histograms along the rows and columns of an image.
% The function calculates the average intensity values for each row (Hx) and each
% column (Hy) of the input image.

% INPUTS:
%   - Im: input grayscale image (2D array)

% OUTPUTS:
%   - Hy: histogram along the rows (1D array)
%   - Hx: histogram along the columns (1D array)

% Get the size of the input image
[X, Y] = size(Im);

% Initialize arrays to store histograms along rows (Hx) and columns (Hy)
Hx = zeros(1, X);
Hy = zeros(1, Y);

% Compute histogram along rows (Hx)
for i = 1:X
    Sum = 0;
    % Loop through each pixel in the current row
    for j = 1:Y
        % Accumulate intensity values in the current row
        Sum = Sum + double(Im(i, j));
    end
    % Calculate the average intensity value for the current row
    Hx(1, i) = Sum / Y;
end

% Compute histogram along columns (Hy)
for i = 1:Y
    Sum = 0;
    % Loop through each pixel in the current column
    for j = 1:X
        % Accumulate intensity values in the current column
        Sum = Sum + double(Im(j, i));
    end
    % Calculate the average intensity value for the current column
    Hy(1, i) = Sum / X;
end

end
