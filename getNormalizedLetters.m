function [ letters ] = getNormalizedLetters( fileName, rows, columns )
    image = imread(fileName);
    image = ~im2bw(image);
    image = bwlabel(image);
    regions = regionprops(image, 'all');
    
    
    [x] = length(regions);
    letters = ones(rows * columns, x);
    for i = 1: x
        b = regions(i).Image;
        resized = imresize(b, [rows columns]);
        resized = resized(:);
        letters(:,i) = resized;
    end
end

