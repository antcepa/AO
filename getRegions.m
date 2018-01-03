%This function read the file specified as a parameter, cuts rectangles
%around dark regions and returns them in a matrix
function [ regions ] = getRegions( fileName )
    image = imread(fileName);
    image = ~im2bw(image);
    image = bwlabel(image);
    regions = regionprops(image, 'all');
end

