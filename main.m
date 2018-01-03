clear;
clc;

%codeDefinition
global codeLen;
codeLen = 26;
% code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ',' '.'];
code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ',' '.'];

%W macierzy o takich wymiarach zostanie zapisany ka¿dy region
regionHeight = 14;
regionWidth = 14;
%Nazwa pliku który bêdzie dekodowany
toDecrypt = 'singleLine.png';

%Reading code pattern
readCode = getNormalizedLetters('alphabet_without_I.png', regionHeight, regionWidth);

%Reading code to decrypt
toDecryptMatrix = getNormalizedLetters(toDecrypt, regionHeight, regionWidth);

string = [];
[x y] = size(toDecryptMatrix);

for i = 1:y
    withLetter = [readCode toDecryptMatrix(:,i)];
    convergenceArray = corrcoef(withLetter);
    dist = pdist(convergenceArray, 'euclidean');
    odl = squareform(dist);


    last = odl(1:codeLen, codeLen + 1);
    [value index] = min(last);
    string = [string code(index)];
    withLetter = withLetter(:,codeLen);
end
string
%message = decryptString(readCode, toDecryptMatrix, code)