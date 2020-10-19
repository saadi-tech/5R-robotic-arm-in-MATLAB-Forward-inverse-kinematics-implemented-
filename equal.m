function [ s ] = equal( init,final )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

status = zeros(1,length(init));
for i = 1:length(init)

    if ( abs(final(i)-init(i))<0.5)
        status(i) = 1;
    end
    
end

if sum(status) == length(init)
    s = 1;
else
    s = 0;
end

