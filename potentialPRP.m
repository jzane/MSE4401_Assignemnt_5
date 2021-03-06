function G = potentialPRP(q)
    % pass q bc it is more straightforward to code,
    % I'll take the hit on computational efficiency
    % 
    % define the gravitational constant, g
    g = 9.81;
    
    % Define mass
    m = [0.3, 0.3, 0.3];
    
    % define unit vector in Z direction
    Z = [0; 0; 1];
    
    % Calculate the joint origins
    [T01, T02, T03] = fkinPRP(q);

    % extract the z components of each origin
    O(1) = T01(3,4);
    O(2) = T02(3,4);
    O(3) = T03(3,4);

    
    for i = 1:3
        P_temp(i,1) = transpose(g)*m(i)*O(i); % only need unit vector
    end
    
    % concatenate 
    
    P = P_temp(1,1) +  P_temp(2,1) +  P_temp(3,1);

    G(1,1) = diff(P,q(1)); 
    G(2,1) = diff(P,q(2)); 
    G(3,1) = diff(P,q(3)); 


end