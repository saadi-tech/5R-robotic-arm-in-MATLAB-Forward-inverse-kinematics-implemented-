function [ out ] = MatrixLog6( T )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
R = T(1:3,1:3);
p = T(1:3,4);

omgmat = MatrixLog3(R);
if isequal(omgmat, zeros(3))
    expmat = [zeros(3), T(1: 3, 4); 0, 0, 0, 0];
else
    theta = acos((trace(R) - 1) / 2);
   expmat = [omgmat, (eye(3) - omgmat / 2 ...
                      + (1 / theta - cot(theta / 2) / 2) ...
                        * omgmat * omgmat / theta) * p;
              0, 0, 0, 0];  
end
out = expmat;
end

