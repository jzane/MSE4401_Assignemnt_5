
function J = jacobPRP(q, L2)
% Returns the full jacobian matrix of the PRP manipualtor
    J = [0, -cos(q(2))*(L2 + q(3)), -sin(q(2)); 
         0, -sin(q(2))*(L2 + q(3)), cos(q(2));
         1, 0, 0;
         0, 0, 0;
         0, 0, 0;
         0, 1, 0];

end