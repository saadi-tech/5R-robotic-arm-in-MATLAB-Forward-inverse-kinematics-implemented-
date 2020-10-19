function [ success,thetalist ] = Inv_kinematics_body( Blist,thetalist,ed,eomega,M,Td,max_iter )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Blist = Screw-axis twist taken in BODY-FRAME! DIM(6xangles)
%Thetalist = list of initial guess thetas (radians) [Row vector]
%ev = error in endpoint displacement
%eomega = error disired in endpoint orientation,
%M = Transformation matrix M (Tsb of end effector in home position
%Td = Desired transformation matrix...
%Max iterations to find the solution

Tbd = Td;
B = Blist;
ev = ed;
eomg = eomega;
thetalist = thetalist';

i = 0;
maxiterations = max_iter;
Vb = se3ToVec(MatrixLog6(inv(PoE_body(M, B, thetalist')) * Tbd));

err = norm(Vb(1: 3)) > eomg || norm(Vb(4: 6)) > ev;
while err && i < maxiterations
    thetalist;
    iteration = i;
    disp('PINV');
    pinv(Jacobian_body(B, thetalist'));
    thetalist = thetalist + pinv(Jacobian_body(B, thetalist')) * Vb;
    
    i = i + 1;
    Vb = se3ToVec(MatrixLog6(inv(PoE_body(M, B, thetalist')) * Tbd));
    err = norm(Vb(1: 3)) > eomg || norm(Vb(4: 6)) > ev;
    
    
end
success = ~ err;
if (success == 1)
    disp('Solution found!');
    %angles = (180/pi)*thetalist
else
    disp('No Solution found!! :( ')
end


end

