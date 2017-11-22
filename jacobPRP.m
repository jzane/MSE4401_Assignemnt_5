
function [Jv, Jw, J] = jacobPRP(q)
% Returns the full jacobian matrix of the PRP manipualtor
[T01, T02, T03] = fkinPRP(q);

% origins and Z vectors;
O0 = [0; 0; 0];
O1 = T01(1:3, 4);
O2 = T02(1:3, 4);
O3 = T03(1:3, 4);

Z0 = [0; 0; 1];
Z1 = T01(1:3, 3);
Z2 = T02(1:3, 3);
Z3 = T03(1:3, 3);

Zcross1 = cross(Z1, O3-O1);

    J = [Z0,Zcross1, Z2; 
         [0, 0, 0], Z1, [0, 0, 0]];
    Jv = J(1:3, :);
    Jw = J(4:6, :);
    
    % returning the jacobian, linear, and rotational sub-jacobians

end