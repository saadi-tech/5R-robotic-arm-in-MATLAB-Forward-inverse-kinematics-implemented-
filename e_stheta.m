function [ matrix ] = e_stheta( S,theta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


w = S(1:3,1)';

v = S(4:6,1);


%w = [0 1 0];

w_bracket = [0 -w(3) w(2);w(3) 0 -w(1);-w(2) w(1) 0 ];

ewtheta = eye(3) + sin(theta)*w_bracket + (1-cos(theta))*w_bracket*w_bracket;

%v = [-0.0089 ;0;0];
up_right = ( eye(3)*theta + (1-cos(theta))*w_bracket + (theta-sin(theta))*w_bracket*w_bracket)*v;

exp = zeros(4,4);
exp(1:3,1:3) = ewtheta;
exp(1:3,4) = up_right;
exp(4,4) = 1;
matrix = exp;


end

