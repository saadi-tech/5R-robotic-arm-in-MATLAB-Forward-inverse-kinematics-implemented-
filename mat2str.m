function [ str ] = mat2str( matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
str = '';
for i = 1:length(matrix)
    for j = 1:length(matrix)
        str = str+'  '+ num2str(matrix(i,j));
    end
    str = str+';'+'\n';
end


end

