function [ napis ] = decryptString(readCode, toDecryptMatrix, code )
    [x y] = size(toDecryptMatrix);
    napis = [];
    for i = 1:y
        index = decryptLetter2(readCode, toDecryptMatrix(:, i))
        if index < 22
            napis = [napis code(index)];
        else
            index
        end
    end
end

