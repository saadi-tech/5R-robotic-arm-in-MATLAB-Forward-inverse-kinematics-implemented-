function [ out ] = adj_representation( T )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

out = zeros(6,6);
R = T(1:3,1:3);
out(1:3,1:3) = R;
P = T(1:3,4)';


out(4:6,1:3)= bracket_form(P)*R;
out(4:6,4:6) = R;

end

