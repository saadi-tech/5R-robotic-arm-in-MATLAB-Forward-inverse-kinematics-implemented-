function [ J ] = Jacobian_body( B,theta )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Jb = zeros(6,length(theta));

Jb(:,length(theta)) = B(:,length(theta));
for i  = length(theta)-1:-1:1
    
    
     total = e_stheta(-B(:,length(theta)),theta(length(theta)));
    for j = length(theta)-1:-1:i+1
       
        total = total*e_stheta(-B(:,j),theta(j));
        
    end
    
   Jb(:,i) = adj_representation(total)*B(:,i);

    
end

J = Jb;

end

