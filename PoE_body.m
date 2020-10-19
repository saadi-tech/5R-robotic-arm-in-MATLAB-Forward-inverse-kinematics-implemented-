function [ Tout ] = PoE_body( M,B,theta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Tout = eye(4);



Tout = eye(4);
Tout = Tout*M;
for i = 1:length(theta)
  
    % S(:,i),theta(i)
   Tout  = Tout*e_stheta(B(:,i),theta(i));
    
    
end



 

end

