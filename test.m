clear;
clc;

regions = getCode('code.bmp');

pattern = regionsToArray(regions, 7, 7);

od = checkConvergence(pattern, 'JLetterBig.bmp');

leter = imread('JLetterBig.bmp');
leter = ~im2bw(leter);
leter = bwlabel(leter);
region = regionprops(leter, 'all');
leter = region(1).Image;
leter = imresize(leter, [7 7]);
leter = leter(:);
    
withLeter = [pattern leter];
convergenceArray = corrcoef(withLeter);
dist = pdist(convergenceArray, 'cosine');
odl = squareform(dist);


last = odl(1:22, 23);
[value index] = max(last);