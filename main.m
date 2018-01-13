clear;
clc;

%codeDefinition
global codeLen;
global code;
codeLen = 27;
% codeLen = 26;
code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ',' '.'];
% code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ',' '.'];

%W macierzy o takich wymiarach zostanie zapisany ka¿dy region
global regionHeight;
global regionWidth;
regionHeight = 14;
regionWidth = 14;
%Nazwa pliku który bêdzie dekodowany
% toDecrypt = 'singleLine.png';
toDecrypt = 'multiLine.png';
%toDecrypt = 'multiLine_Simple.png';

%Reading code pattern
% codeImage = readImage('alphabet_without_I.png');
codeImage = readImage('alphabet.png');
codeNormalized = getNormalizedLettersFromImage(codeImage);

textImage = readImage(toDecrypt);
% getNormalizedLettersFromImage(codeImage);
text = decryptText(codeNormalized, textImage);



