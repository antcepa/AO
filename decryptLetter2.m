function [ index ] = decryptLetter( pattern, letterVector)
    withLeter = [pattern letterVector];
    convergenceArray = corrcoef(withLeter)
    [x, y] = size(pattern);
    [value index] = max( convergenceArray(:,y+1) )
end

