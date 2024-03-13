function avgValue = estimateAverageValue(image, boxSize)
    % Estimate the average pixel value within a sample box
    % INPUTS:
    %   - image: the input image (2D array)
    %   - boxSize: size of the sample box for averaging
    
    % Get the dimensions of the input image
    [rows, columns] = size(image);

    % Initialize a matrix to store the average pixel values
    avgValue = zeros(rows, columns);

    % Loop through the image in boxSize-sized steps
    for i = 1:rows/boxSize
        for j = 1:columns/boxSize
            % Calculate the starting indices of the current sample box
            index_y = (boxSize * i) - (boxSize - 1);
            index_x = (boxSize * j) - (boxSize - 1);
            
            % Extract the current sample box using imcrop
            box = imcrop(image, [index_x index_y boxSize-1 boxSize-1]);
            
            % Calculate the mean of all pixel values in the sample box
            avgValue(index_y:index_y+boxSize-1, index_x:index_x+boxSize-1) = mean(box, 'all');
        end
    end
end