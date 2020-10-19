function [ out ] = bracket_form( w )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
out = [0 -w(3) w(2);w(3) 0 -w(1);-w(2) w(1) 0 ];

end

