Jb = zeros(6,5);
theta = [0 0 pi/2 0 0];
L = [2 2 2 1];
S = [0 0 0 1 0;
     0 -1 -1 0 -1;
     1 0 0 0 0;
     0 0 0 0 0;
     0 0 0 0 0;
     0 0 -(L(1)) 0 -(L(1)+L(2)+L(3));
];


Jb(:,5) = S(:,5);
for i = 2:length(theta)
   
    total = e_stheta(S(:,5),theta(5));
    
   for j = 2:i-1
       
       total = total*e_stheta(S(:,j),theta(j));
   end
   
   Jb(:,i) = adj_representation(total)*S(:,i);
   disp('==');
end

