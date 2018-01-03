clear;
clc;

%codeDefinition
code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'W' 'Y' 'X'];

%W macierzy o takich wymiarach zostanie zapisany ka¿dy region
regionHeight = 7;
regionWidth = 7;
%Nazwa pliku który bêdzie dekodowany
toDecrypt = 'czwor.bmp';

%Reading code pattern
%codeRegions = getRegions('code.bmp');
%readCode = regionsToArray(codeRegions, regionHeight, regionWidth);
readCode = getNormalizedLetters('code.bmp', 7, 7);

%Reading code to decrypt
%regionsToDecrypt = getRegions(toDecrypt);
%toDecryptMatrix = regiosToArray(regionsToDecrypt, regionHeight, regionWidth);
toDecryptMatrix = getNormalizedLetters(toDecrypt, 7, 7);

string = [];
[x y] = size(toDecryptMatrix);

for i = 1:y
    withLetter = [readCode toDecryptMatrix(:,i)];
    convergenceArray = corrcoef(withLetter);
    dist = pdist(convergenceArray, 'euclidean');
    odl = squareform(dist);


    last = odl(1:22, 23);
    [value index] = min(last);
    string = [string code(index)];
    %index = decryptLetter2(readCode, toDecryptMatrix(:, i))
    withLetter = withLetter(:,22);
end
string
%message = decryptString(readCode, toDecryptMatrix, code)
