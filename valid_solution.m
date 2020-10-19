function [ S ] = valid_solution( theta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
status = zeros(1,length(theta));

if (theta(1)>-180 && theta(1)<180) && (theta(2)>-160 && theta(2)<160) && (theta(3)>-160 && theta(3)<160) && (theta(4)>-160 && theta(4)<160) && (theta(5)>-160 && theta(5)<160)
    S =1;
else
    S = 0;
end

end

