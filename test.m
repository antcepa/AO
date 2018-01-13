image = readImage('singleLine.png');
begEndIsIndexes = getLettersBegEndIsIndexes(image);
%cut fitst sign if white space (0)
begEndIsIndexes = [begEndIsIndexes (begEndIsIndexes(:, 2) - begEndIsIndexes(:, 1))];
if begEndIsIndexes(1, 3) == 0
    begEndIsIndexes = begEndIsIndexes(2:end, :);
end

[signs, el] =  size(begEndIsIndexes);
amountOfWhiteSpaces = 0;
spaces = [];
for i = 1: signs
    if  begEndIsIndexes(i, 3) == 0
        amountOfWhiteSpaces = amountOfWhiteSpaces + 1;
        spaces = [spaces  begEndIsIndexes(i, 4)];
    end
end
max(spaces)
min(spaces)
isSpace = [];
for space = spaces
    diffFromMin = abs(space - min(spaces));
    diffFromMax = abs(space - max(spaces));
    if diffFromMax < diffFromMin
        isSpace = [isSpace 1];
    else
        isSpace = [isSpace 0];
    end
end
isSpace