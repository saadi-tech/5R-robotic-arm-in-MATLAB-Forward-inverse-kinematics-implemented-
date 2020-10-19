function [ t ] = trace( R )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = 1:size(R,1)
  sum = sum + R(i,i);
end
t = sum;

end

