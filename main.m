clear;
clc;

%codeDefinition
global codeLen;
global code;
codeLen = 52;
% codeLen = 26;
code = ['A' 'a' 'B' 'b' 'C' 'c' 'D' 'd' 'E' 'e' 'F' 'f' 'G' 'g' 'H' 'h' 'I' 'i' 'J' 'j' 'K' 'k' 'L' 'l' 'M' 'm' 'N' 'n' 'O' 'o' 'P' 'p' 'R' 'r' 'S' 's' 'T' 't' 'U' 'u' 'V' 'v' 'W' 'w' 'X' 'x' 'Y' 'y' 'Z' 'z' ',' '.'];
% code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ',' '.'];

%W macierzy o takich wymiarach zostanie zapisany ka�dy region
global regionHeight;
global regionWidth;
regionHeight = 14;
regionWidth = 14;
%Nazwa pliku kt�ry b�dzie dekodowany
%toDecrypt = 'singleLine.png';
% toDecrypt = 'multiLine.png';
% toDecrypt = 'text_Calibri_32.png';
toDecrypt = 'text_Calibri_72.png';

%Reading code pattern
codeImage = readImage('code_Calibri_72.png');
codeNormalized = getNormalizedLettersFromImage(codeImage);


textImage = readImage(toDecrypt);
lettersToRead = getNormalizedLettersFromImage(codeImage);

text = decryptText(codeNormalized, textImage);



