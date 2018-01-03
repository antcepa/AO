function [ index ] = decryptLetter( pattern, letterImage)
    letter = imresize(letterImage, [7 7]);
    letter = letter(:);
    
    withLeter = [pattern letter];
    convergenceArray = corrcoef(withLeter);
    [x y] = size(pattern);
    [value index] = max( convergenceArray(:,y+1) )
end

