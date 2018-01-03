function [ convergenceArray ] = checkConvergence( pattern, leterFileName )
    leter = imread(leterFileName);
    leter = ~im2bw(leter);
    leter = bwlabel(leter);
    region = regionprops(leter, 'all');
    leter = region(1).Image;
    leter = imresize(leter, [7 7]);
    leter = leter(:);
    
    withLeter = [pattern leter];
    convergenceArray = corrcoef(withLeter);
end

