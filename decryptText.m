function [ text ] = decryptText( codeNormalized, textImage)
    begEndLinesYIndexes = getLinesBegEndIndexes(textImage);
    [y, x] = size(begEndLinesYIndexes);
    text = '';
    for i = 1: y
        lineStartYIndex = begEndLinesYIndexes(i, 1);
        lineEndYIndex = begEndLinesYIndexes(i, 2);
        [sth, textImageXSize] = size(textImage);
        lineFrame = zeros(lineEndYIndex - lineStartYIndex + 3, textImageXSize);
        lineFrame(2:end - 1, :) = textImage(lineStartYIndex:lineEndYIndex, :);  
    %     imshow(lineFrame);
        line = decryptSingleLineText(codeNormalized, lineFrame);
        text = strcat(text, '->' , line);
    end
    text
end

