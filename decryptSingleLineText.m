function [ string ] = decryptSingleLineText( readCode, lineImage )
    global regionHeight;
    global regionWidth;
    global codeLen;
    global code;

    toDecryptMatrix = getNormalizedLetters(lineImage, regionHeight, regionWidth);
    size(toDecryptMatrix)
    
    string = [];
    y = size(toDecryptMatrix, 2);

    for i = 1:y
        size(toDecryptMatrix(:,i));
        withLetter = [readCode toDecryptMatrix(:,i)];
        convergenceArray = corrcoef(withLetter);
        dist = pdist(convergenceArray, 'euclidean');
        odl = squareform(dist);


        last = odl(1:codeLen, codeLen + 1);
        [value index] = min(last);
        string = [string code(index)];
        withLetter = withLetter(:,codeLen);
    end
end