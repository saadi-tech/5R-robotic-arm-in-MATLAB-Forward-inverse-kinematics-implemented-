h1 = 2;
Links=[10,10,10,5];
M = [1 0 0 sum(Links); 0 0 -1 0; 0 1 0 h1;0 0 0 1;];
B = [0 0 0 1 0 0; 1 0 0 0 0 0 ; 0 1 1 0 1 1; 0 0 0 0 0 0; 0 sum(Links) sum(Links(1,2:4)) 0 Links(4) 0; -sum(Links) 0 0 0 0 0;];
thetas = [0 0 0 0 0];
%PoE_body(M,B,thetas)
%Td = [0 -1 0 5.4142;0 0 -1 0; 1 0 0 3.9142;0 0 0 1];

%example cases:
Td = [0 -1 0 20; 0 0 -1 0;1 0 0 5;0 0 0 1];
[S,thetas] = Inv_kinematics(B,thetas,0.1,0.1,M,Td,50);
if (S ==1 )
    disp('Angles (Degrees):');
    (180/pi)*thetas
    disp('=============');
    disp('Resulting position:');
    PoE_body(M,B,thetas')
else
    disp('Sorry, I tried my best :( ');
end