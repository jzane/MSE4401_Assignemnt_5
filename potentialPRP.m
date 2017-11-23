function G = potentialPRP(q)
    % pass q bc it is more straightforward to code,
    % I'll take the hit on computational efficiency
    % 
    % define the gravitational constant, g
    g = 9.81;

    % Define mass
    m = [0.3, 0.3 0.3];
    
    % define unit vector in Z direction
   Z = [0; 0; 1];
    
    % Calculate the joint origins
    [T01, T02, T03] = fkinPRP(q);

    O1 = T01(1:3,4);
    O2 = T02(1:3,4);
    O3 = T03(1:3,4);
    
    for i = 1:3
        P_temp(i, :) = m(i)*Z; % multiply by unit vectorto get rid of the other directions (x and y)
    end
    
    % concatenate 
    
    P = P_temp(1,:) +  P_temp(2,:) +  P_temp(3,:);



end