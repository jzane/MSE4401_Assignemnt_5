%
function [T01, T02, T03] = fkinPRP(q)
% Returns the transofrmation matrix of a PRP manipulator with joint angles q
% and a link-offset distance of L2
%
% 3 return values are the 3 x 3 transformation matrices of the joints

    L1 = 20; % 20 cm
    L2 = 10; % 10 cm
    T01 = [1, 0, 0, 0;
           0, 1, 0, 0;
           0, 0, 1, (L1+q(1));
           0, 0,0, 1];
       
    T02 = [cos(q(2)), 0, -sin(q(2)), 0;
           sin(q(2)), 0, cos(q(2)), 0;
           0, -1, 0, (L1+q(1))
           0, 0, 0, 1]; 
    
    %   T03 = [-sin(q(2))*(L2 + q(3)); cos(q(2))*(L2 + q(3)); q(1)];  

    
    T03 = [cos(q(2)), 0, -sin(q(2)), -sin(q(2))*(L2 + q(3));
         sin(q(2)), 0, cos(q(2)), cos(q(2))*(L2 + q(3));
         0, -1, 0, (L1+q(1));
         0, 0, 0, 1];


end



