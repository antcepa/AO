function [ pattern ] = regionsToArray( regions, rows, columns )
    [x y] = size(regions);
    pattern = ones(rows * columns, x);
    for i = 1: x
        b = regions(i).Image;
        resized = imresize(b, [rows columns]);
        resized = resized(:);
        pattern(:,i) = resized;
    end
end

