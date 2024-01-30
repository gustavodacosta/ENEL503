function [Im] = CGBSCR1G2B3(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Im = repmat({}, 7);
Im(1,1).image = imread(image);
Im(1,2).image = rgb2gray(Im(1,1).image);
Im(1,3).image = imbinarize(Im(1,2).image);
Im(1,4).image = grayslice(Im(1,2).image, 20);
Im(1,5).image = Im(1,1).image(:,:,1);
Im(1,6).image = Im(1,1).image(:,:,2);
Im(1,7).image = Im(1,1).image(:,:,3);

end